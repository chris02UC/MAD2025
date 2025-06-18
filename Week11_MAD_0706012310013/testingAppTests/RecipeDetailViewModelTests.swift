//
//  RecipeDetailViewModelTests.swift
//  testingAppTests
//
//  Created by student on 08/05/25.
//

import XCTest
@testable import testingApp

final class RecipeDetailViewModelTests: XCTestCase {

    let dummyRecipe = Recipe(
        id: 1,
        name: "Classic Margherita Pizza",
        ingredients: [],
        instructions: [],
        prepTimeMinutes: 10,
        cookTimeMinutes: 15,
        servings: 2,
        difficulty: .easy,
        cuisine: "Italian",
        caloriesPerServing: 300,
        tags: [],
        userID: 1,
        image: "",
        rating: 4.5,
        reviewCount: 100,
        mealType: []
    )
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testLoadFavoriteStatusInitiallyFalse() async {
        FakeJSONMemoryStore.shared.reset() // ← reset memory to prevent pollution

        let storage = FakeRecipeStorageService()
        let viewModel = RecipeDetailViewModel(storageService: storage, recipe: dummyRecipe)

        await viewModel.loadFavoriteStatus()

        XCTAssertFalse(viewModel.isFavorite, "Recipe should not be a favorite initially")
    }


    func testToggleFavoriteAddsRecipe() async {
        let storage = FakeRecipeStorageService()
        let viewModel = RecipeDetailViewModel(storageService: storage, recipe: dummyRecipe)

        await viewModel.toggleFavorite()

        let favorites = try? await storage.fetchFavoriteRecipes()
        XCTAssertTrue(favorites?.contains(where: { $0.id == dummyRecipe.id }) ?? false, "Recipe should be added to favorites")
        XCTAssertTrue(viewModel.isFavorite, "isFavorite should be true after toggling on")
    }

    func testToggleFavoriteRemovesRecipe() async {
        let storage = FakeRecipeStorageService()
        try? await storage.saveFavoriteRecipe(dummyRecipe) // Pre-favorite

        let viewModel = RecipeDetailViewModel(storageService: storage, recipe: dummyRecipe)
        await viewModel.loadFavoriteStatus()

        XCTAssertTrue(viewModel.isFavorite, "Should initially be favorite")

        await viewModel.toggleFavorite()

        let favorites = try? await storage.fetchFavoriteRecipes()
        XCTAssertFalse(favorites?.contains(where: { $0.id == dummyRecipe.id }) ?? true, "Recipe should be removed from favorites")
        XCTAssertFalse(viewModel.isFavorite, "isFavorite should be false after toggling off")
    }

}
