package ua.graduateproject.restaurant.repository;

import ua.graduateproject.restaurant.model.Meal;

import java.util.List;

public interface MealRepository {

    Meal get(int id, int menuId);

    Meal save(Meal meal, int menuId);

    boolean delete(int id);

    List<Meal> getAll();
}