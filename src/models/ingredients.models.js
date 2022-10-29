const { DataTypes } = require("sequelize");
const db = require("../utils/database");
const Types = require("./types.models");

const ingredients = db.define("ingredients",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    typeId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      field: "type_id",
      references: {
        key: id,
        model: Types,
      },
    },
    urlImg: {
      type: DataTypes.STRING,
      field: "img_url",
      validate: {
        isUrl: true,
      },
    },
  },
  {
    //? Evita que sequelize cree la columna de createdAt y updatedAt
    timestamps: false,
  }
);

module.exports = ingredients;
