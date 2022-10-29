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


-----------------------------------------------------------------------------------------------

DB DIAGRAM:

// Recetas
// Ingredientes
// Usuarios
// Recetas-Usuario
// Ingredientes del Usuario 
// Pasos de una receta

table users {
  id uuid [pk]
}

table recipes {
  id uuid [pk]
  title varchar [not null]
  description text [not null]
  url_img varchar 
  time int [not null]
  portions int [not null]
  user_id uuid [not null]
  category_id int [not null]
  origin varchar
  likes int [default: 0]
}

table users_recipes {
  id uuid [pk]
  user_id uuid [not null]
  recipes_id uuid [not null]
  favorite bool [default: false]
}

table ingredients_recipes {
  id uuid [pk]
  recipes_id uuid [not null]
  ingredient_id uuid [not null]
  amount varchar [not null]
}

table ingredients_users{
  id uuid [pk]
  user_id uuid [not null]
  ingredient_id uuid [not null]
  amount varchar [not null]
}

table categories {
  id serial [pk]
  name varchar [ not null ]
}

table ingredients {
  id uuid [pk]
  name varchar [not null]
  type_id int [ not null]
  url_img varchar 
}

table types {
  id serial [pk]
  name varchar [ not null ]
}

table instructions {
  id uuid [pk]
  recipes_id uuid [not null]
  step int [not null]
  description varchar [not null]
}

Ref: "users"."id" < "recipes"."user_id"

Ref: "users"."id" < "users_recipes"."user_id"

Ref: "recipes"."id" < "users_recipes"."recipes_id"

Ref: "categories"."id" < "recipes"."category_id"

Ref: "types"."id" < "ingredients"."type_id"

Ref: "recipes"."id" < "ingredients_recipes"."recipes_id"

Ref: "ingredients"."id" < "ingredients_recipes"."ingredient_id"

Ref: "users"."id" < "ingredients_users"."user_id"

Ref: "ingredients"."id" < "ingredients_users"."ingredient_id"

Ref: "recipes"."id" < "instructions"."recipes_id"
