const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  return pool
    .query(`
  SELECT *
  FROM users
  WHERE email = $1;`, [email])
    .then(res => {
      if (res.rows[0]) {
        return res.rows[0];
      } else {
        return null;
      }
    })
    .catch((err) => {
      console.err(err.message)
    });
};

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return pool
    .query(`
  SELECT *
  FROM users
  WHERE id = $1;`, [id])
    .then(res => {
      if (res.rows[0]) {
        return res.rows[0];
      } else {
        return null;
      }
    })
    .catch(err => {
      console.log(err.message)
    });
};

exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  return pool
    .query(`
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;`, [user.name, user.email, user.password])
    .then(newUser => {
      return newUser;
    })
    .catch(err => {
      console.log(err.message);
    })
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  return pool
    .query(`SELECT properties.*, reservations.*, AVG(property_reviews.rating) as average_rating
  FROM reservations
  JOIN properties ON property_id = properties.id 
  JOIN property_reviews ON reservation_id = reservations.id
  WHERE reservations.guest_id = $1 AND reservations.end_date < now()::date
  GROUP BY properties.id, reservations.id
  ORDER BY reservations.start_date
  LIMIT $2;`, [guest_id, limit])
    .then((res) => {
      return (res.rows);
    })
    .catch((err) => {
      console.log(err.message);
    });
};

exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

 const getAllProperties = function (options, limit = 10) {
  let queryParams = [];
  let query = `
  SELECT properties.*, AVG(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;
  for (let parameter in options)  {
    if (parameter === 'city' && options[parameter]) {
      queryParams.push(`%${options[parameter]}%`)
      query += `WHERE city LIKE $${queryParams.length}`;
    } else if (queryParams.length === 0 && parameter === 'minimum_price_per_night' && options[parameter]) {
      queryParams.push(options[parameter])
      query += `WHERE cost_per_night >= $${queryParams.length}`
    } else if (queryParams.length === 0 && parameter === 'maximum_price_per_night' && options[parameter]) {
      queryParams.push(options[parameter])
      query += `WHERE cost_per_night <= $${queryParams.length}`
    } else if (parameter === 'minimum_price_per_night' && options[parameter]) {
      queryParams.push(options[parameter])
      query += `AND cost_per_night >= $${queryParams.length}`
    } else if (parameter === 'maximum_cost_night' && options[parameter]) {
      queryParams.push(options[parameter])
      query += `AND cost_per_night = $${queryParams.length}`
    }
  };

  query += `
  GROUP BY properties.id`;

  if (options['minimum_rating']) {
    queryParams.push(options.minimum_rating)
    query += `
    HAVING AVG(property_reviews.rating) >= $${queryParams.length}`
  }

  queryParams.push(limit);
  query += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};`;

  return pool.query(query, queryParams)
     .then(res => res.rows)
     .catch(err => {
       console.log(err)
     });
}


exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const query = `
  INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
  RETURNING *;`
  const queryParams = [property.owner_id, property.title, property.description, property.thumbnail_photo_url, property.cover_photo_url, property.cost_per_night, property.parking_spaces, property.number_of_bathrooms, property.number_of_bedrooms, property.country, property.street, property.city, property.province, property.post_code]

  return pool.query(query, queryParams)
    .then(res => res.rows[0])
    .catch(err => {
      console.log(err)
    });
}
exports.addProperty = addProperty;
