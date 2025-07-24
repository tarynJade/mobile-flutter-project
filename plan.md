# Flutter Recipe App Development Plan

## Project Overview
Building a Flutter recipe application with clean architecture, separation of concerns, and reusable components. The app will fetch data from the Spoonacular API.

## Basic Architecture
- Feature-based folder structure
- Repository pattern for data management
- Provider for state management
- Reusable components

## Simple Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── api_constants.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── widgets/
│       ├── custom_search_bar.dart
│       ├── custom_bottom_nav.dart
│       └── custom_app_bar.dart
├── screens/
│   ├── home_screen.dart
│   ├── recipe_list_screen.dart
│   ├── recipe_detail_screen.dart
│   └── favorites_screen.dart
├── widgets/
│   ├── recipe_card.dart
│   ├── app_logo.dart
│   └── favorite_recipe_widget.dart
├── services/
│   ├── api_service.dart
│   └── storage_service.dart
├── models/
│   ├── recipe.dart
│   └── recipe_detail.dart
├── providers/
│   ├── recipe_provider.dart
│   └── favorite_provider.dart
└── main.dart
```

## Reusable Components

### Core Widgets
1. **CustomSearchBar** - Search input used across multiple screens
2. **CustomBottomNav** - Navigation bar for main screens
3. **CustomAppBar** - Top bar with back button and logo options
4. **RecipeCard** - Recipe display card for lists

### Screen-Specific Widgets
1. **AppLogo** - Logo for home screen
2. **FavoriteRecipeWidget** - Recipe display for favorites

## Service Layer Organization

### API Service (lib/services/api_service.dart)
- Handle Spoonacular API calls
- Search recipes, get recipe details
- Manage API key and endpoints

### Storage Service (lib/services/storage_service.dart)
- Save/load favorites locally
- Cache recipe data
- User preferences

## Data Models

### Recipe (lib/models/recipe.dart)
- Basic recipe info for lists
- ID, title, image, cooking time

### RecipeDetail (lib/models/recipe_detail.dart)
- Full recipe information
- Ingredients, instructions, nutrition

## State Management

### RecipeProvider (lib/providers/recipe_provider.dart)
- Manage recipe search results
- Handle loading states
- API call coordination

### FavoriteProvider (lib/providers/favorite_provider.dart)
- Manage favorite recipes
- Local storage operations
- Add/remove favorites

## Dependencies to Add

```yaml
dependencies:
  provider: ^6.1.1          # State management
  http: ^1.1.0              # API calls
  shared_preferences: ^2.2.2 # Local storage
  cached_network_image: ^3.3.0 # Image caching
```

## Development Steps

### Phase 1: Basic Setup
1. Add dependencies to pubspec.yaml
2. Create folder structure
3. Set up basic theme and constants
4. Create main navigation structure

### Phase 2: Core Components
1. Build reusable widgets (SearchBar, BottomNav, AppBar)
2. Create API service for Spoonacular
3. Set up data models
4. Create providers for state management

### Phase 3: Screen Implementation
1. Home Screen - Logo, search, navigation
2. Recipe List Screen - Search results, recipe cards
3. Recipe Detail Screen - Full recipe view with tabs
4. Favorites Screen - Saved recipes

### Phase 4: Integration
1. Connect API service to providers
2. Implement local storage for favorites
3. Add loading states and error handling
4. Polish UI and add animations

## Screen Requirements Summary

**Home Screen**: Logo + Search + Bottom Nav
**Recipe List**: Search + Recipe Cards + Bottom Nav  
**Recipe Detail**: Top Nav + Image + Ingredients/Instructions Tabs
**Favorites**: Top Nav + Favorite Recipe Cards

This simplified structure focuses on clean separation while keeping implementation straightforward.
