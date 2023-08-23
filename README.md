# Pagination
Objective:
Create a simple IOS app that fetches data from an API and displays it in a table view

Requirements:

Create a new iOS Swift project.
Design a basic user interface with a table view to display the fetched data.
Fetch data from a public API (e.g., JSONPlaceholder: https://jsonplaceholder.typicode.com/posts).
Parse the fetched JSON data and display it in the table view.
Implement error handling in case the API request fails.
Include a refresh button to manually trigger data fetching.
Add a detail screen to display more information about a selected item from the table view.
Implement infinite scroll pagination where the data fetches 20 rows from the API and loads another 20 once the user scrolls to the bottom (JSONPlaceholder does not support pagination, handling it client side as an example of the implementation is allowed)
Steps:

Create the UI:

Add a UITableView to the main view controller.
Design a custom table view cell to display each item's data (e.g., title and body of a post).
Add a "Refresh" button at the top of the screen.
Fetch and Display Data:

Set up a model structure to represent the fetched data (e.g., a Post struct with userId, id, title, and body properties).
Create a networking manager class to handle API requests using URLSession.
Implement a function to fetch data from the API and update the UI once the data is fetched.
Use the fetched data to populate the table view cells.
Error Handling:

Handle errors that might occur during the API request, such as network issues or server errors.
Display an appropriate error message to the user if the API request fails.
Refresh Button:

Implement a function to fetch data when the "Refresh" button is tapped.
Update the table view with the newly fetched data.
Detail Screen:

Create a new view controller for displaying details of a selected item.
Pass the selected item's data to the detail view controller.
Display the item's details on the detail view controller.
Testing:

Test the app on the iOS simulator or a physical device.
Ensure that data is fetched, displayed correctly in the table view, and that error handling works as expected
