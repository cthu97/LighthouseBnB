INSERT INTO users (name, email, password) 
VALUES ('Alan Turing', 'alanturing@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
('Amy Santiago', 'santiago@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dumbledore', 'dumbledead@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES ('Speed Lamp', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 960.23, 4, 3, 5, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', TRUE),
('Blank corner', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 804.53, 1, 2, 2, 'Canada', '134 Mainway St.', 'Vancouver', 'British Columbia', 'V2K 3H5', TRUE),
('Habit mix', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 950.00, 2, 2, 5, 'Canada', '1650 Hejto Center', 'Jaebvap', 'Ontario', '38051', TRUE);

INSERT INTO reservations (start_date, end_date, property_id, property_id, guest_id) VALUES (2018-09-11, 2018-09-25, 2, 3),
(2019-01-04, 2019-02-01, 2, 2),
(2021-01-01, 2021-02-01, 1, 4);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) VALUES (1, 1, 1, 'messages'), (1, 2, 3, 'messages'), (3, 1, 2, 'messages');