
## Getting started

MultiScreenBuilder helps to develope different layout for mobile , table and desktop/web with custom breakpoints with ease.

## Example

example of using ResponsiveBuilder

```dart
MultiScreenBuilder(
      mobileBuilder: (context, constraints) {
        return const MobileView();
      },
      tabletBuilder: (context, constraints) { 
        return const TabletView(),
      },
      desktopBuilder: (context, constraints) {
        return Column(
          children: const [
            YourWidgetsHere(),
            ....
          ],
        );
      },
    )
```

## Additional information

check the device type based on screen size.

```dart
    // mobile
    MultiScreenBuilder.isMobile(context);

    // tablet
    MultiScreenBuilder.isTablet(context);

    // desktop
    MultiScreenBuilder.isDesktop(context);

```
