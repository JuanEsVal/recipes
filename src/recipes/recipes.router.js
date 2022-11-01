const router = require("express").Router();
const passport = require("passport");                   //Siempre que quiera protejer una ruta (1)

const recipeServices = require("./recipes.services");
require("../middlewares/auth.middleware")(passport);    //Siempre que quiera protejer una ruta (2)

//? /recipes
//? /recipes/:recipe_id

router.route("/")
  .get(recipeServices.getAllRecipes)
  .post(
    passport.authenticate("jwt", { session: false }), //Siempre que quiera protejer una ruta (3)
    recipeServices.createRecipe
  );

router.route("/:recipe_id")
  .get(recipeServices.getRecipeById)
  .patch(
    passport.authenticate("jwt", { session: false }),
    recipeServices.patchRecipe
  )
  .delete(
    passport.authenticate("jwt", { session: false }),
    recipeServices.deleteRecipe
  );

module.exports = router;
