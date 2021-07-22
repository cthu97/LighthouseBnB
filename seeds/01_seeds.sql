INSERT INTO users (id, name, email, password) 
VALUES (1, 'Alan Turing', 'alanturing@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
(2, 'Amy Santiago', 'santiago@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(3, 'Dumbledore', 'dumbledead@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (1, 'Speed Lamp', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 960.23, 4, 3, 5, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', TRUE),
(2, 'Blank corner', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 804.53, 1, 2, 2, 'Canada', '134 Mainway St.', 'Vancouver', 'British Columbia', 'V2K 3H5', TRUE),
(3, 'Habit mix', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 950.00, 2, 2, 5, 'Canada', '1650 Hejto Center', 'Jaebvap', 'Ontario', '38051', TRUE);

INSERT INTO reservations (id, start_date, end_date, property_id, property_id, guest_id) VALUES (1,  2018-09-11, 2018-09-25, 2, 3),
(2, 2019-01-04, 2019-02-01, 2, 2),
(3, 2021-01-01, 2021-02-01, 1, 4);

INSERT INTO property_reviews (id, guest_id, property_id, reservation_id, rating, message) VALUES (1, 1, 1, 1, 'messages'), (2, 1, 2, 3, 'messages'), (2, 3, 1, 2, 'messages');