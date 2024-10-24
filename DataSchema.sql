-- Таблиця користувачів
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL CHECK (user_name ~ '^[A-Za-z]+$'),
    email_address VARCHAR(100) NOT NULL CHECK (
        email_address ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    user_role VARCHAR(50) CHECK (
    user_role IN ('User', 'Admin', 'LightingSpecialist'))
);

-- Таблиця фільтрів
CREATE TABLE filters (
    filter_id INT PRIMARY KEY,
    filter_name VARCHAR(100) NOT NULL,
    filter_value VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Таблиця повідомлень
CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    notification_message TEXT NOT NULL,
    notification_priority VARCHAR(50) CHECK (
        notification_priority IN ('Low', 'Medium', 'High')
    ),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Таблиця спеціалістів з освітлення
CREATE TABLE lighting_specialists (
    specialist_id INT PRIMARY KEY,
    specialist_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(100) NOT NULL CHECK (
        email_address ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    )
);

-- Таблиця звітів по освітленню
CREATE TABLE lighting_reports (
    report_id INT PRIMARY KEY,
    report_analysis TEXT NOT NULL,
    report_recommendation TEXT NOT NULL,
    specialist_id INT,
    user_id INT,
    FOREIGN KEY (specialist_id) REFERENCES lighting_specialists (specialist_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Таблиця будинків
CREATE TABLE houses (
    house_id INT PRIMARY KEY,
    house_address VARCHAR(255) NOT NULL,
    house_price REAL NOT NULL CHECK (house_price > 0),
    house_description TEXT
);
