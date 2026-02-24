# CourseListingApp

A SwiftUI course listing app. Fetches posts from [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts) and presents them as a course catalog.

---

## Architecture — MVVM

```
CourseListingApp/
├── Models/
│   └── Course.swift                  # Codable data model
├── Networking/
│   └── CourseService.swift           # URLSession + async/await, Protocol-based
├── ViewModels/
│   └── CourseListViewModel.swift     # ObservableObject, state management, filtering, caching
├── Views/
│   ├── CourseListView.swift          # Main list screen
│   ├── CourseDetailView.swift        # Detail screen
│   └── Components/
│       ├── CourseRowView.swift       # Reusable list row
│       ├── LoadingUIView.swift         # Loading state UI
│       ├── ErrorView.swift           # Error state UI with retry
│       └── EmptyStateView.swift      # Empty search result UI
└── CourseListingApp.swift            # App entry point

```

### Data Flow
`View` → calls ViewModel method → `ViewModel` → calls `CourseService` → `URLSession` → JSON → decoded into `[Course]` → published back to View.

---

## Features
- Fetch & display courses from JSONPlaceholder API
- Search/filter by title (local, case-insensitive)
- Loading, error (with retry), and empty states
- Pull to refresh
- Basic in-memory caching (avoids redundant network calls)
- NavigationStack with detail screen

---

## Trade-offs

| Decision | Reason |
|---|---|
| In-memory cache (not disk) | Sufficient for this scale; disk caching would add complexity without clear benefit |
| `@MainActor` on ViewModel | Ensures all UI state updates happen on main thread without manual `DispatchQueue.main` calls |
| `ViewState` enum | Single source of truth for UI state; avoids boolean flag combinations |
| Protocol on `CourseService` | Enables clean unit testing in future updates |
| `@StateObject` in root view | ViewModel lifecycle tied to the view that owns it |

---

## Requirements
- Xcode 15+
- iOS 16+
- Swift 5.9+

---

## Time Spent
~4 hours

---

## How to Run
1. Clone the repo
2. Open `CourseListingApp.xcodeproj` in Xcode
3. Select a simulator (iOS 16+)
4. Press `Cmd + R`

To run tests: `Cmd + U`
