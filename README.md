 # Bitcoin Exchange Rate App

This simple iOS app allows the user to see the current price of 1 Bitcoin (BTC) in a selected currency. It uses the **ExchangeRate API** to fetch real-time data.

---

## How to Use

1. Open the app.
2. Use the picker at the bottom to select a currency.
3. The current value of 1 BTC in the selected currency will be displayed on the screen.

---

## Technologies and Concepts Used

- **Swift & UIKit**: for the app interface and UI components.
- **URLSession**: to make network requests and fetch JSON data from the API.
- **Decodable**: to parse JSON responses.
- **Completion Closures**: to handle asynchronous network responses and update the UI.
- **UIPickerView**: for currency selection.
- **StackView & AutoLayout**: to layout UI elements responsively.
- **Extensions & MARK**: to organize code in a clean and readable way.

---

## What We Learned

- Working with APIs: fetching JSON and displaying it in the UI.
- Managing asynchronous operations and updating UI safely (DispatchQueue.main.async).
- Using Swift extensions and MARK comments to improve code readability.
- Implementing interactive UI with UIPickerView.
- Proper handling of network requests in iOS apps.

---

## Future Improvements

- Auto-refresh rates for selected currencies.
- Display historical Bitcoin price charts.
- Enhance UI design and add better error handling.

---

## License

This project is licensed under the MIT License.
