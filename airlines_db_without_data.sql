CREATE TABLE `aiport` (
  `id` int(11) NOT NULL,
  `iata_code` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `airline` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `number_of_planes` int(11) NOT NULL,
  `completed_flights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `crew` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `airplane_id` int(11) DEFAULT NULL,
  `crew_id` int(11) DEFAULT NULL,
  `flight_number` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `purchased_tickets` int(11) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `flight_length` int(11) DEFAULT NULL,
  `place_of_departure_id` int(11) DEFAULT NULL,
  `place_of_arrival_id` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `flight_booking` (
  `id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `age` int(11) NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `passport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `pilot` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `age` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `crew_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `plane` (
  `id` int(11) NOT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `fuel_usage` int(11) DEFAULT NULL,
  `number_of_total_seats` int(11) DEFAULT NULL,
  `number_of_used_seats` int(11) DEFAULT NULL,
  `amount_of_fuel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `stewardess` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `age` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `crew_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `seat_number` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `travel_class` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `relief` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;


ALTER TABLE `aiport`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `airline`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `crew`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline_id` (`airline_id`),
  ADD KEY `airplane_id` (`airplane_id`),
  ADD KEY `crew_id` (`crew_id`),
  ADD KEY `place_of_departure_id` (`place_of_departure_id`),
  ADD KEY `place_of_arrival_id` (`place_of_arrival_id`);

ALTER TABLE `flight_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `passenger`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pilot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crew_id` (`crew_id`);

ALTER TABLE `plane`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline_id` (`airline_id`);

ALTER TABLE `stewardess`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crew_id` (`crew_id`);

ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`);


ALTER TABLE `aiport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`airplane_id`) REFERENCES `plane` (`id`),
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`),
  ADD CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  ADD CONSTRAINT `flight_ibfk_5` FOREIGN KEY (`airplane_id`) REFERENCES `plane` (`id`),
  ADD CONSTRAINT `flight_ibfk_6` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`),
  ADD CONSTRAINT `flight_ibfk_7` FOREIGN KEY (`place_of_arrival_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `flight_ibfk_8` FOREIGN KEY (`place_of_departure_id`) REFERENCES `airport` (`id`);

ALTER TABLE `flight_booking`
  ADD CONSTRAINT `flight_booking_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  ADD CONSTRAINT `flight_booking_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

ALTER TABLE `pilot`
  ADD CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`);

ALTER TABLE `plane`
  ADD CONSTRAINT `plane_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  ADD CONSTRAINT `plane_ibfk_2` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`);

ALTER TABLE `stewardess`
  ADD CONSTRAINT `stewardess_ibfk_1` FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`);

ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);