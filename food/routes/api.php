<?php

use App\Http\Middleware\MyAuth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get("home", "App\Http\Controllers\Food@home")->name("home");

Route::get("category", "App\Http\Controllers\Food@category")->name("category");

Route::get("states", "App\Http\Controllers\Food@states")->name("states");

Route::get("single_product/{id}", "App\Http\Controllers\Food@single_product")->name("single_product");

Route::post("register", "App\Http\Controllers\Food@register")->name("register");

Route::post("login", "App\Http\Controllers\Food@login")->name("login");

Route::post("add_to_cart/{id}", "App\Http\Controllers\Food@add_to_cart")->name("add_to_cart");

Route::get("show_cart_item", "App\Http\Controllers\Food@show_cart_item")->name("show_cart_item");



Route::middleware([MyAuth::class])->group(function () {

    Route::post("add_product", "App\Http\Controllers\Food@add_product")->name("add_product");
});



// Route::get('home','App\Http\Controllers\Food@home')->name('home');