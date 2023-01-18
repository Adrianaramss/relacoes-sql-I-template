-- Active: 1673873946987@@127.0.0.1@3306


-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);


CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO users (id,name,email,password)
VALUES 
     ("u001","camilla","camilla@gmail.com","camilla123"),
     ("u002","Igor", "igor@gmail.com","igorigor");


INSERT INTO phones (id, phone_number, user_id)
VALUES
     ("p001","551491111111","u001"),
     ("p002","551492222222","u001"),
     ("p003","551433333333","u002");



--  INSERT INTO phones (id, phone_number, user_id)
--  VALUES
--      ("p004","5514744444444", "u003") ;   --viria 

-- DELETE FROM phones
-- WHERE user_id = "u003";

--  SELECT *FROM users;   
--  SELECT *FROM phones; 

 SELECT * FROM users  -- tabela A
 INNER JOIN phones   -- tabela B
 ON phones.user_id = users.id;

 -- pratica 3 = 1.1
 CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL, --- chave estrangeira
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES 
    ("l001", "11111111111", "A"),
    ("l002", "22222222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "Carlos Bergson", "carlosb@email.com", "carlosbbb", "l001"),
    ("d002", "Tais Zimerer", "zimerertais@email.com", "tais00", "l002");

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;
