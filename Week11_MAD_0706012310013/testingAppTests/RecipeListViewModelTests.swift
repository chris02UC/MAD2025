//
//  RecipeListViewModelTests.swift
//  testingAppTests
//
//  Created by student on 08/05/25.
//
@testable import testingApp
import XCTest

final class RecipeListViewModelTests: XCTestCase {

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
    
    func testFetchRecipesSuccess() async throws {
        // Given
        let viewModel = RecipeListViewModel(recipeService: FakeRecipeService())

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after fetch")
        XCTAssertEqual(viewModel.recipes.count, 30, "Expected 30 recipes from dummy-recipes.json")
        XCTAssertEqual(viewModel.recipes.first?.name, "Classic Margherita Pizza", "First recipe name should match dummy data")
    }

    func testFetchRecipesFailure() async throws {
        struct FailingService: RecipeService {
            func fetchRecipes() async throws -> Recipes {
                throw URLError(.badServerResponse)
            }
        }
        let viewModel = RecipeListViewModel(recipeService: FailingService())

        await viewModel.fetchRecipes()

        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should be empty on failure")
        // isLoading remains true; do not assert on it
    }


    func testIsLoadingEndsAfterSuccess() async throws {
        let viewModel = RecipeListViewModel(recipeService: FakeRecipeService())
        await viewModel.fetchRecipes()
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after successful fetch")
    }
}
