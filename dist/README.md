# Archive builds (`/dist`)

With Xcode (currently 13.2.1) open and having it as the foreground app (so it takes over the menu bar with its menu items), do the following:

1. With the project open, ensure the Version and Build are incremented in the `auto-clicker.xcodeproj` 'General' tab under the `auto-clicker` Target on the left
2. Then in the menu bar click 'Product' then 'Archive'
3. This brings up the project organizer with a list of Archives
4. Next with the desired Archive selected, click 'Distribute App'
5. Select 'Copy App' and press 'Next'
6. In the file dialogue, open the `/dist` directory and click 'Export'
7. Navigate to the `/dist` directory in Finder and pull the Archive out of the auto-generated subdirectory and into the root `/dist` directory, overwriting the existing `Auto Clicker.app` with the new `Auto Clicker.app`

Further reading can be found here: [https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/](https://jameshfisher.com/2017/08/12/xcode-build-dmg-for-distribution-macos/)
