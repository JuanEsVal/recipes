CREATE TABLE "users" (
  "id" uuid PRIMARY KEY
);

CREATE TABLE "recipes" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "url_img" varchar,
  "time" int NOT NULL,
  "portions" int NOT NULL,
  "user_id" uuid NOT NULL,
  "category_id" int NOT NULL,
  "origin" varchar,
  "likes" int DEFAULT 0
);

CREATE TABLE "users_recipes" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "recipes_id" uuid NOT NULL,
  "favorite" bool DEFAULT false
);

CREATE TABLE "ingredients_recipes" (
  "id" uuid PRIMARY KEY,
  "recipes_id" uuid NOT NULL,
  "ingredient_id" uuid NOT NULL,
  "amount" varchar NOT NULL
);

CREATE TABLE "ingredients_users" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "ingredient_id" uuid NOT NULL,
  "amount" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "ingredients" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "type_id" int NOT NULL,
  "url_img" varchar
);

CREATE TABLE "types" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "instructions" (
  "id" uuid PRIMARY KEY,
  "recipes_id" uuid NOT NULL,
  "step" int NOT NULL,
  "description" varchar NOT NULL
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_recipes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_recipes" ADD FOREIGN KEY ("recipes_id") REFERENCES "recipes" ("id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "ingredients" ADD FOREIGN KEY ("type_id") REFERENCES "types" ("id");

ALTER TABLE "ingredients_recipes" ADD FOREIGN KEY ("recipes_id") REFERENCES "recipes" ("id");

ALTER TABLE "ingredients_recipes" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("id");

ALTER TABLE "ingredients_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "ingredients_users" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("id");

ALTER TABLE "instructions" ADD FOREIGN KEY ("recipes_id") REFERENCES "recipes" ("id");
