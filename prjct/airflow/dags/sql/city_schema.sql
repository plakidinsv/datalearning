CREAT TABLE IF NOT EXIST city(
    city_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    city_name VARCHAR(50)
    );