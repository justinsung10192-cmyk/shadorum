--Database of user data for the application


CREATE DATABASE IF NOT EXISTS main_database;
USE main_database;

CREATE TABLE IF NOT EXISTS users (
    uid VARCHAR(20) NOT NULL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    apple_sub VARCHAR(255) UNIQUE NULL,
    password_hash VARCHAR(255) NOT NULL,
    status ENUM('active','banned','inactive','deleted','frozen') NOT NULL DEFAULT 'active',
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_ip_history(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    user_agent VARCHAR(255) NOT NULL,
    last_login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_user_ip_history_user FOREIGN KEY (user_uid) REFERENCES users(uid) ON DELETE CASCADE,
    INDEX idx_user_uid (user_uid),
    INDEX idx_ip_address (ip_address)
);