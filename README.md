Wishlist

A modern iOS wishlist application built with SwiftUI and SwiftData, allowing users to manage their wishes and track their completion status.

## Features

- Create and manage a list of wishes
- Mark wishes as completed/incomplete
- Delete wishes with swipe actions
- Persistent storage using SwiftData
- Clean and intuitive user interface
- Wish counter
- Empty state handling

## Technical Details

### Architecture
- Built using SwiftUI for the user interface
- Utilizes SwiftData for persistent storage
- Follows MVVM architecture pattern

### Key Components

1. **Wish Model**
   - Core data model representing a wish item
   - Properties:
     - `title`: String - The wish description
     - `isCompleted`: Boolean - Completion status

2. **Main Views**
   - `ContentView`: Main interface showing the wishlist
   - Features:
     - List view of all wishes
     - Swipe actions for completion and deletion
     - Add new wish functionality
     - Wish counter
     - Empty state handling

3. **Data Management**
   - Uses SwiftData for persistence
   - Automatic data synchronization
   - CRUD operations for wishes

## User Interface

The app provides a clean and intuitive interface with the following features:
- Navigation stack with "Wishlist" title
- Add button in the top-right corner
- Swipe left to mark as complete/incomplete
- Swipe right to delete
- Wish counter at the bottom
- Empty state message when no wishes exist

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run the application

## Preview Support

The app includes two preview configurations:
- Sample Data Preview: Shows the app with sample wishes
- Empty View Preview: Shows the app's empty state
