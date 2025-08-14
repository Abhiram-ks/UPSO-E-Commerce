# ecommerce_upso

# Project Overview:
A lightweight, offline-first e‑commerce cart sample built with Flutter + Dart, using Hive (NoSQL) for local storage and Provider for state management. The codebase follows a Clean Architecture + modular structure so features remain testable, scalable, and easy to maintain.

# Key Features
- Product catalog (local assets) with predefined items bootstrapped into Hive on first run.
- Add to Cart with quantity increment/decrement, remove item, and clear cart.
- Add‑to‑cart timestamp stored (addedAt) to support recent items and analytics.
- User Preferences persisted (currency, theme, sort order, showOnlyInStock, etc.).
- Derived totals: subtotal, grand total.
- Offline‑ready (all data local) and fast startup via Hive boxes.
- State management via Provider (fine‑grained ChangeNotifier), selectors for optimal rebuilds.
- Unit‑testable domain with repositories + use cases.

# Tech Stack
Framework: Flutter | Language: Dart | Local DB: Hive (NoSQL) + Hive Adapters | State Management: Provider | Linting: flutter_lints
