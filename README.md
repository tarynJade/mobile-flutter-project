# What’s Cooking? – Recipe Finder App

A cross-platform Flutter mobile application that helps users discover recipes based on ingredients they already have at home. The app is designed for home cooks, students, and busy individuals, aiming to reduce food waste and make meal planning easier.

---

## Features

- **Ingredient-Based Search:**  
  Enter one or more ingredients in the search bar to find recipes you can make with what’s in your kitchen.

- **Recipe Grid:**  
  Search results are displayed in a responsive grid of recipe cards, each showing an image and title.

- **Recipe Details:**  
  Tap a recipe card to view a detailed screen with a large image, ingredients list, and step-by-step instructions organized in tabs.

- **Favourites:**  
  Save your favourite recipes with a heart icon. Favourites are stored locally and persist between app sessions.

- **Bottom Navigation:**  
  Easily switch between Home and Favourites screens using the bottom navigation bar.

- **Error Handling:**  
  User-friendly error messages and retry options if the API fails or no recipes are found.

- **Accessibility:**  
  Large touch targets, readable fonts, and color contrast for an accessible experience.

---

## API Integration

This app uses the [Spoonacular API](https://spoonacular.com/food-api) to fetch recipe data:

- **Search Recipes:**  
  When the user submits ingredients, the app sends a request to the Spoonacular API to retrieve recipes that match those ingredients.

- **Recipe Details:**  
  When viewing a recipe, the app fetches detailed information (ingredients, instructions, images) from the API using the recipe’s ID.

- **API Service:**  
  All API requests and JSON parsing are handled in the `ApiService` class.

---

## Main Screens

- **Home Screen:**  
  - Logo banner and search bar for ingredient input  
  - Displays search results in a grid  
  - Shows a prompt if no search has been made

- **Recipe Detail Screen:**  
  - Large recipe image and title  
  - Tabs for ingredients and instructions  
  - Heart icon to favourite recipes

- **Favourites Screen:**  
  - Grid of saved recipes  
  - Persistent storage using `SharedPreferences`

---

## Folder Structure

- `lib/screens` – Main app screens (Home, Recipe Detail, Favourites)
- `lib/widgets` – Reusable UI components (SearchBar, RecipeCard, ErrorMessage, etc.)
- `lib/services` – API and Favourites management
- `lib/models` – Data models (Recipe)

---

## Credits

- [Spoonacular API](https://spoonacular.com/food-api) for recipe data
- Flutter & Dart

---

