//
//  FavoriteRecipeViewModelTests.swift
//  testingAppTests
//
//  Created by student on 08/05/25.
//

import XCTest
@testable import testingApp

final class FavoriteRecipeViewModelTests: XCTestCase {
    
    let recipe1 = Recipe(
        id: 1,
        name: "Recipe One",
        ingredients: [],
        instructions: [],
        prepTimeMinutes: 10,
        cookTimeMinutes: 10,
        servings: 2,
        difficulty: .easy,
        cuisine: "Italian",
        caloriesPerServing: 250,
        tags: [],
        userID: 1,
        image: "",
        rating: 4.5,
        reviewCount: 20,
        mealType: []
    )

    let recipe2 = Recipe(
        id: 2,
        name: "Recipe Two",
        ingredients: [],
        instructions: [],
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        servings: 3,
        difficulty: .medium,
        cuisine: "Asian",
        caloriesPerServing: 300,
        tags: [],
        userID: 2,
        image: "",
        rating: 4.7,
        reviewCount: 10,
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
    
    func testInitFavoriteRecipesLoadsData() async throws {
            let storage = FakeRecipeStorageService()
            try await storage.saveFavoriteRecipe(recipe1)
            try await storage.saveFavoriteRecipe(recipe2)

            let viewModel = FavoriteRecipeViewModel(storageService: storage)
            await viewModel.initFavoriteRecipes()

            XCTAssertEqual(viewModel.favoriteRecipes.count, 2, "Should load 2 favorite recipes")
            XCTAssertTrue(viewModel.favoriteRecipes.contains { $0.id == 1 })
            XCTAssertTrue(viewModel.favoriteRecipes.contains { $0.id == 2 })
        }

        func testDeleteFavoriteRecipe() async throws {
            let storage = FakeRecipeStorageService()
            try await storage.saveFavoriteRecipe(recipe1)
            try await storage.saveFavoriteRecipe(recipe2)

            let viewModel = FavoriteRecipeViewModel(storageService: storage)
            await viewModel.initFavoriteRecipes()
            XCTAssertEqual(viewModel.favoriteRecipes.count, 2)

            await viewModel.deleteFavoriteRecipe(recipe1)
            XCTAssertEqual(viewModel.favoriteRecipes.count, 1, "One recipe should remain after deletion")
            XCTAssertFalse(viewModel.favoriteRecipes.contains { $0.id == recipe1.id })
        }
    
    func testIsLoadingEndsAfterInit() async throws {
        // Clear memory to ensure test isolation
        FakeJSONMemoryStore.shared.reset()

        let storage = FakeRecipeStorageService()
        let viewModel = FavoriteRecipeViewModel(storageService: storage)

        await viewModel.initFavoriteRecipes()

        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after fetch")
        XCTAssertTrue(viewModel.favoriteRecipes.isEmpty, "Should have no favorites by default")
    }

//        func testIsLoadingTogglesDuringFetch() async throws {
//            let storage = FakeRecipeStorageService()
//            let viewModel = FavoriteRecipeViewModel(storageService: storage)
//
//            let expectation = XCTestExpectation(description: "Loading state finishes")
//            XCTAssertFalse(viewModel.isLoading)
//
//            Task {
//                await viewModel.initFavoriteRecipes()
//                expectation.fulfill()
//            }
//
//            XCTAssertTrue(viewModel.isLoading, "isLoading should be true during fetch")
//            await fulfillment(of: [expectation], timeout: 2.0)
//            XCTAssertFalse(viewModel.isLoading, "isLoading should be false after fetch")
//        }

}
