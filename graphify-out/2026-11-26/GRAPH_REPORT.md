# Graph Report - TrustedRoomie  (2026-11-26)

## Corpus Check
- 212 files · ~50,771 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 21 file(s) not represented in the graph (top: .ttf 13, (none) 2, .plist 2)

## Summary
- 1505 nodes · 3143 edges · 145 communities (75 shown, 70 thin omitted)
- Extraction: 90% EXTRACTED · 10% INFERRED · 0% AMBIGUOUS · INFERRED: 321 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `bd3f2ff4`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- String
- InputWithLabel
- PermissionManager
- AppNavHost
- RoomieTask
- StarRatingBar
- ButtonStyle
- Font Assets & Definitions
- ListingCardItem
- ListingReviewCard
- Typography & Font Tokens
- Input
- BottomSheetRoute
- InputFormat
- SwitchItem
- BaseSimpleButton
- BaseBottomSheet
- ToggleChip
- PaymentPaymentsItem
- ListingClosePlacesCard
- PublishAddSection
- Sendable
- BaseListingCardSection
- Chip
- HomeRoute
- ChatBalloonLeft
- BottomCTAButton
- Color
- GreenCTAButton
- DropdownInput
- Observation
- .body
- RoomieSectionHeader
- BeigeButton
- RoundCheckBox
- String
- SelectedFile
- SendInviteBottomBar
- MonthlyPaymentItem
- NotifyPaymentBottomSheet
- ScreenConfig
- SharedPaymentBottomSheet
- DocumentPickerRepresentable
- Equatable
- BaseCard
- PlannerDestination
- UnifiedFilePickerModifier
- .body
- HomeTabHeader
- ViewModifier
- LocationInfoMessage
- TaskItem
- HomeScreen
- .body
- FilePickerMode
- LocationRepository
- ProfileEmptyState
- RoomieColorTokens
- HomeScaffold
- BaseGreenCard
- ProfileSessionStartedState
- ScreenTopBar
- DeleteListingBottomSheet
- Foundation
- LocationError
- PasswordRecoveryConfirmationScreen
- OnboardingRoute
- LocationService
- DefaultButton
- UpdateRentBottomSheet
- PublishAddText
- PublishCurrentAddress
- NetworkError
- ExploreMap
- HideListingItem
- NavigationRouter
- RoomieListItem
- ChangePasswordScreen
- View
- FilePickerRepositoryProtocol
- ListingInfoSection
- LocationModel
- BasicText
- .body
- .body
- CardBackground
- PublishAddPaymentSection
- RateItem
- PublishRules
- InlineNavigationTitleModifier
- SwiftUI
- NavigationRouter
- RoomInfoPill
- PublishAdd
- PublishAmenities
- PublishNearbyPlaces
- PublishSharedServices
- LocationRepositoryProtocol
- LeaveRequestBottomBar
- AddEventItem
- AddTaskItem
- PasswordRecoveryScreen

## God Nodes (most connected - your core abstractions)
1. `NavigationRouter` - 155 edges
2. `PermissionManager` - 33 edges
3. `PermissionStatus` - 31 edges
4. `BaseCard` - 31 edges
5. `Input` - 26 edges
6. `SelectedFile` - 25 edges
7. `LocationModel` - 23 edges
8. `PermissionType` - 23 edges
9. `InputFormat` - 23 edges
10. `InputWithLabel` - 22 edges

## Surprising Connections (you probably didn't know these)
- `.body` --calls--> `HomeScreen`  [INFERRED]
  TrustedRoomie/UI/Navigation/AppNavHost.swift → TrustedRoomie/UI/Screen/Home/HomeScreen.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Publish/PublishListingInfo.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `InputWithLabel`  [INFERRED]
  TrustedRoomie/UI/Screen/Settings/ChangePasswordScreen.swift → TrustedRoomie/UI/Components/Common/InputWithLabel.swift
- `.body` --calls--> `PublishAddPaymentSection`  [INFERRED]
  TrustedRoomie/UI/Components/Listing/Publish/PublishSharedServices.swift → TrustedRoomie/UI/Components/Listing/Publish/PublishAddPaymentSection.swift
- `.body` --calls--> `Input`  [INFERRED]
  TrustedRoomie/UI/Components/Common/InputWithLabel.swift → TrustedRoomie/UI/Components/Common/Input.swift

## Import Cycles
- None detected.

## Communities (145 total, 70 thin omitted)

### Community 0 - "String"
Cohesion: 0.29
Nodes (6): ApartmentHistoryItem, .id, ApartmentItem, .body, ProfileHistory, .body

### Community 1 - "InputWithLabel"
Cohesion: 0.21
Nodes (4): InputWithLabel, .body, PersonalInfoScreen, .body

### Community 2 - "PermissionManager"
Cohesion: 0.05
Nodes (26): PermissionStatus, authorized, .canRequestDirectly, denied, .displayName, .isAuthorized, limited, notDetermined (+18 more)

### Community 3 - "AppNavHost"
Cohesion: 0.17
Nodes (6): MyApp, .body, AppNavHost, .body, NavigationScreen, .body

### Community 4 - "RoomieTask"
Cohesion: 0.09
Nodes (12): ContentView, .body, CodingKeys, completed, id, title, RoomieTask, NetworkService (+4 more)

### Community 5 - "StarRatingBar"
Cohesion: 0.29
Nodes (3): StarRatingBar, .body, .displayText

### Community 6 - "ButtonStyle"
Cohesion: 0.21
Nodes (3): .body, RoomiePineButtonStyle, RoomiePrimaryButtonStyle

### Community 7 - "Font Assets & Definitions"
Cohesion: 0.10
Nodes (21): AppFont, DMSans, extraBold, extraLight, light, medium, .name, regular (+13 more)

### Community 8 - "ListingCardItem"
Cohesion: 0.08
Nodes (15): BaseScaffold, .body, ExploreList, .body, ExploreListingCard, ListingCardItem, MapView, .body (+7 more)

### Community 9 - "ListingReviewCard"
Cohesion: 0.21
Nodes (6): ListingPlaceReviews, .body, ListingReviewCard, .highlightedText, ListingTenantReview, .body

### Community 10 - "Typography & Font Tokens"
Cohesion: 0.11
Nodes (18): Font, RoomieFontTokens, RoomieTextStyle, bodyLarge, bodyMedium, displayLarge, displayMedium, .font (+10 more)

### Community 14 - "Input"
Cohesion: 0.20
Nodes (8): Input, .body, .currentRawText, .formattedTextBinding, .shouldShowError, InputWithIcon, .body, .currentTextBinding

### Community 15 - "BottomSheetRoute"
Cohesion: 0.14
Nodes (9): BottomSheetRoute, custom, deleteListing, .id, logout, notifyLeave, notifyPayment, sharedPayment (+1 more)

### Community 16 - "InputFormat"
Cohesion: 0.17
Nodes (7): InputFormat, currency, customMask, .keyboardType, none, number, phone

### Community 17 - "SwitchItem"
Cohesion: 0.06
Nodes (23): SettingOptionItem, .body, SettingOptionItemContent, .body, SwitchItem, .currentBinding, ProfileIsTenantInAddress, .body (+15 more)

### Community 18 - "BaseSimpleButton"
Cohesion: 0.08
Nodes (16): LogoutBottomSheet, .body, .currentBinding, LogoutBottomSheetContent, .body, .descriptionText, NotifyLeaveBottomSheet, .body (+8 more)

### Community 19 - "BaseBottomSheet"
Cohesion: 0.26
Nodes (3): BaseBottomSheet, .body, View

### Community 20 - "ToggleChip"
Cohesion: 0.10
Nodes (11): ToggleChip, .backgroundColor, .body, .currentBinding, .selectedValue, .textColor, FlowLayout, LeaveRequest (+3 more)

### Community 21 - "PaymentPaymentsItem"
Cohesion: 0.18
Nodes (6): PaymentPaymentsItem, .body, .titleFont, RoomiePaymentEntry, PaymentRoomieItem, .body

### Community 22 - "ListingClosePlacesCard"
Cohesion: 0.33
Nodes (4): ListingClosePlacesCard, .body, ListingPlaceItem, .body

### Community 23 - "PublishAddSection"
Cohesion: 0.24
Nodes (3): PublishAddSection, .body, .currentItems

### Community 24 - "Sendable"
Cohesion: 0.05
Nodes (42): HomeTabItem, HomeTabsRegistered, chats, explore, .id, .item, notifications, profile (+34 more)

### Community 25 - "BaseListingCardSection"
Cohesion: 0.14
Nodes (8): BaseListingCardSection, .body, ListingAmenitiesCard, .body, ListingRuleItem, .body, ListingRulesCard, .body

### Community 26 - "Chip"
Cohesion: 0.15
Nodes (12): .body, Chip, .body, GlassChip, .body, GreenChip, .body, YellowChip (+4 more)

### Community 27 - "HomeRoute"
Cohesion: 0.07
Nodes (22): NotificationItemCard, .body, HomeRoute, Home, .id, LeaveRequest, ListingDetails, Messages (+14 more)

### Community 28 - "ChatBalloonLeft"
Cohesion: 0.11
Nodes (11): ChatBalloonLeft, .balloonShape, .body, ChatBalloonRight, .balloonShape, .body, ChatMessageBox, .body (+3 more)

### Community 30 - "Color"
Cohesion: 0.25
Nodes (4): ChatTenantConversationCard, PublishButton, Color, .roomie

### Community 31 - "GreenCTAButton"
Cohesion: 0.24
Nodes (6): GreenCTAButton, .body, GreenCTAButtonStyle, RedCTAButton, .body, .body

### Community 32 - "DropdownInput"
Cohesion: 0.06
Nodes (29): DropdownOption, DropdownInput, .body, .currentOption, .floatingMenu, .resolvedErrorMessage, .shouldShowError, DropdownPreviewContainer (+21 more)

### Community 33 - "Observation"
Cohesion: 0.24
Nodes (4): Observation, ExploreTab, .body, ExploreTabViewModel

### Community 34 - ".body"
Cohesion: 0.12
Nodes (8): ProfileContactSection, .body, ProfileCurrentAddress, ProfilePublishPlaceItem, .body, ProfileReviewsSection, .body, .body

### Community 35 - "RoomieSectionHeader"
Cohesion: 0.16
Nodes (6): LeavingRequestNotification, .body, RoomieSectionHeader, .body, RoomiesTab, .body

### Community 36 - "BeigeButton"
Cohesion: 0.28
Nodes (3): BeigeButton, .body, BeigeButtonStyle

### Community 37 - "RoundCheckBox"
Cohesion: 0.23
Nodes (6): RoundCheckBox, .body, .currentBgColor, .currentBinding, .currentBorderColor, .isChecked

### Community 38 - "String"
Cohesion: 0.19
Nodes (3): EmptyExampleView, String, InputRestriction

### Community 39 - "SelectedFile"
Cohesion: 0.13
Nodes (4): SelectedFile, .formattedSize, .isImage, FilePickerRepository

### Community 41 - "MonthlyPaymentItem"
Cohesion: 0.27
Nodes (6): ListingMonthlyPaymentCard, .body, ListingMonthlySectionItem, .body, MonthlyPaymentItem, .id

### Community 42 - "NotifyPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): NotifyPaymentBottomSheet, .body, .currentBinding, NotifyPaymentBottomSheetContent, .body

### Community 44 - "SharedPaymentBottomSheet"
Cohesion: 0.29
Nodes (5): SharedPaymentBottomSheet, .body, .currentBinding, SharedPaymentBottomSheetContent, .body

### Community 46 - "Equatable"
Cohesion: 0.13
Nodes (9): BaseViewModel, UiEvent, navigate, showSnackbar, UiState, error, idle, loading (+1 more)

### Community 47 - "BaseCard"
Cohesion: 0.21
Nodes (5): BaseCard, .body, .body, EventItem, .body

### Community 48 - "PlannerDestination"
Cohesion: 0.16
Nodes (12): PaymentsDestination, .id, incidents, .label, services, PaymentsScreen, PlannerDestination, events (+4 more)

### Community 49 - "UnifiedFilePickerModifier"
Cohesion: 0.19
Nodes (4): UnifiedFilePickerModifier, .allowedDocumentTypes, .allowMultipleDocuments, .maxPhotosCount

### Community 50 - ".body"
Cohesion: 0.24
Nodes (4): HomeGreenHeaderCard, .body, HomeTab, .body

### Community 51 - "HomeTabHeader"
Cohesion: 0.22
Nodes (5): HomeTabHeader, .body, PlannerEventTab, .body, .body

### Community 52 - "ViewModifier"
Cohesion: 0.21
Nodes (4): AppBackground, RoomieCardModifier, RoomieGlassCardModifier, View

### Community 53 - "LocationInfoMessage"
Cohesion: 0.33
Nodes (4): .body, LocationInfoMessage, .body, .highlightedText

### Community 54 - "TaskItem"
Cohesion: 0.24
Nodes (4): TaskItem, .body, PlannerTasks, .body

### Community 56 - ".body"
Cohesion: 0.33
Nodes (4): ListingLocationSection, ContactButton, ListingDetailScreen, .body

### Community 57 - "FilePickerMode"
Cohesion: 0.19
Nodes (5): FilePickerMode, .defaultDocumentTypes, documents, photos, View

### Community 58 - "LocationRepository"
Cohesion: 0.22
Nodes (3): LocationRepository, StartupPermissionsHandler, View

### Community 59 - "ProfileEmptyState"
Cohesion: 0.24
Nodes (4): ProfileEmptyState, .body, ProfileTab, .body

### Community 60 - "RoomieColorTokens"
Cohesion: 0.47
Nodes (3): RoomieColorTokens, RoomieTheme, .colors

### Community 62 - "BaseGreenCard"
Cohesion: 0.25
Nodes (4): BaseGreenCard, .body, ListingGreenCard, .body

### Community 63 - "ProfileSessionStartedState"
Cohesion: 0.22
Nodes (5): ProfileScreen, .body, ProfileHeader, .body, ProfileSessionStartedState

### Community 64 - "ScreenTopBar"
Cohesion: 0.33
Nodes (3): ScreenTopBar, .body, .body

### Community 65 - "DeleteListingBottomSheet"
Cohesion: 0.26
Nodes (5): DeleteListingBottomSheet, .body, .currentBinding, DeleteListingBottomSheetContent, .body

### Community 66 - "Foundation"
Cohesion: 0.20
Nodes (5): CoreLocation, Foundation, Photos, UIKit, UserNotifications

### Community 67 - "LocationError"
Cohesion: 0.17
Nodes (9): LocationError, emptyAddress, .errorDescription, geocodingFailed, permissionDenied, .requiresSettingsRedirect, servicesDisabled, timeout (+1 more)

### Community 68 - "PasswordRecoveryConfirmationScreen"
Cohesion: 0.14
Nodes (8): View, LoginScreen, .body, PasswordRecoveryConfirmationScreen, .body, .message, SignInScreen, .body

### Community 69 - "OnboardingRoute"
Cohesion: 0.29
Nodes (6): OnboardingRoute, .id, Login, PasswordRecovery, PasswordRecoveryConfirmation, SignIn

### Community 71 - "DefaultButton"
Cohesion: 0.24
Nodes (4): DefaultButton, .body, DefaultButtonStyle, .body

### Community 72 - "UpdateRentBottomSheet"
Cohesion: 0.29
Nodes (5): UpdateRentBottomSheet, .body, .currentBinding, UpdateRentBottomSheetContent, .body

### Community 73 - "PublishAddText"
Cohesion: 0.25
Nodes (5): PublishAddMultipleText, .body, PublishAddText, .body, .currentBinding

### Community 74 - "PublishCurrentAddress"
Cohesion: 0.20
Nodes (7): PublishCurrentAddress, .body, .currentAddress1, .currentAddress2, .currentCity, .currentState, .currentZipCode

### Community 75 - "NetworkError"
Cohesion: 0.20
Nodes (7): NetworkError, decodingError, .errorDescription, httpError, invalidResponse, invalidURL, unknown

### Community 78 - "NavigationRouter"
Cohesion: 0.16
Nodes (7): PaymentIncidentItem, .body, PaymentsIncidents, .body, PaymentsServicesTab, .body, .body

### Community 86 - "LocationModel"
Cohesion: 0.24
Nodes (4): LocationModel, .coordinate, .formattedCoordinates, Place

### Community 87 - "BasicText"
Cohesion: 0.25
Nodes (3): BasicText, .body, .body

### Community 119 - ".body"
Cohesion: 0.25
Nodes (3): PublishListingInfo, .body, .body

### Community 122 - "PublishAddPaymentSection"
Cohesion: 0.24
Nodes (3): PublishAddPaymentSection, .body, .currentItems

### Community 123 - "RateItem"
Cohesion: 0.21
Nodes (4): RateItem, .body, RateRoomie, .body

### Community 132 - "SwiftUI"
Cohesion: 0.22
Nodes (4): MapKit, PhotosUI, SwiftUI, UniformTypeIdentifiers

### Community 133 - "NavigationRouter"
Cohesion: 0.22
Nodes (4): ListingPhotoSection, .body, NavigationRouter, .isBottomSheetPresented

### Community 134 - "RoomInfoPill"
Cohesion: 0.33
Nodes (3): RoomInfoPill, .body, .highlightedText

## Knowledge Gaps
- **212 isolated node(s):** `photos`, `documents`, `.defaultDocumentTypes`, `.formattedSize`, `.isImage` (+207 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 393 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **70 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `String` connect `String` to `String`, `InputWithLabel`, `PermissionManager`, `RoomieTask`, `StarRatingBar`, `Font Assets & Definitions`, `ListingCardItem`, `ListingReviewCard`, `Input`, `BottomSheetRoute`, `InputFormat`, `SwitchItem`, `BaseSimpleButton`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `Sendable`, `BaseListingCardSection`, `Chip`, `HomeRoute`, `ChatBalloonLeft`, `BottomCTAButton`, `Color`, `GreenCTAButton`, `DropdownInput`, `.body`, `RoomieSectionHeader`, `BeigeButton`, `SelectedFile`, `SendInviteBottomBar`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `Equatable`, `BaseCard`, `PlannerDestination`, `.body`, `LocationInfoMessage`, `TaskItem`, `.body`, `ProfileEmptyState`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `DeleteListingBottomSheet`, `LocationError`, `PasswordRecoveryConfirmationScreen`, `OnboardingRoute`, `LocationService`, `DefaultButton`, `UpdateRentBottomSheet`, `PublishAddText`, `PublishCurrentAddress`, `NetworkError`, `HideListingItem`, `NavigationRouter`, `RoomieListItem`, `ChangePasswordScreen`, `ListingInfoSection`, `LocationModel`, `BasicText`, `.body`, `PublishAddPaymentSection`, `RateItem`, `PublishRules`, `InlineNavigationTitleModifier`, `RoomInfoPill`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `PublishSharedServices`, `LocationRepositoryProtocol`, `LeaveRequestBottomBar`, `AddEventItem`, `AddTaskItem`, `PasswordRecoveryScreen`?**
  _High betweenness centrality (0.464) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `NavigationRouter` (e.g. with `ContentView` and `AppNavHost`) actually correct?**
  _`NavigationRouter` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `photos`, `documents`, `.defaultDocumentTypes` to the rest of the system?**
  _212 weakly-connected nodes found - possible missing edges._
- **Should `PermissionManager` be split into smaller, more focused modules?**
  _Cohesion score 0.050721954831543875 - nodes in this community are weakly interconnected._
- **Why does `SwiftUI` connect `SwiftUI` to `String`, `InputWithLabel`, `PermissionManager`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `ButtonStyle`, `Font Assets & Definitions`, `ListingCardItem`, `ListingReviewCard`, `Typography & Font Tokens`, `Input`, `SwitchItem`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `Sendable`, `BaseListingCardSection`, `Chip`, `HomeRoute`, `ChatBalloonLeft`, `BottomCTAButton`, `Color`, `GreenCTAButton`, `DropdownInput`, `Observation`, `.body`, `RoomieSectionHeader`, `BeigeButton`, `RoundCheckBox`, `String`, `SendInviteBottomBar`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `ScreenConfig`, `SharedPaymentBottomSheet`, `BaseCard`, `PlannerDestination`, `.body`, `HomeTabHeader`, `ViewModifier`, `TaskItem`, `HomeScreen`, `.body`, `LocationRepository`, `ProfileEmptyState`, `RoomieColorTokens`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `DeleteListingBottomSheet`, `Foundation`, `PasswordRecoveryConfirmationScreen`, `DefaultButton`, `UpdateRentBottomSheet`, `PublishAddText`, `PublishCurrentAddress`, `ExploreMap`, `HideListingItem`, `NavigationRouter`, `RoomieListItem`, `ChangePasswordScreen`, `View`, `ListingInfoSection`, `BasicText`, `.body`, `.body`, `CardBackground`, `PublishAddPaymentSection`, `RateItem`, `PublishRules`, `InlineNavigationTitleModifier`, `NavigationRouter`, `RoomInfoPill`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `PublishSharedServices`, `LeaveRequestBottomBar`, `AddEventItem`, `AddTaskItem`, `PasswordRecoveryScreen`?**
  _High betweenness centrality (0.185) - this node is a cross-community bridge._
- **Should `RoomieTask` be split into smaller, more focused modules?**
  _Cohesion score 0.08912655971479501 - nodes in this community are weakly interconnected._
- **Why does `NavigationRouter` connect `NavigationRouter` to `String`, `InputWithLabel`, `PublishRules`, `AppNavHost`, `RoomieTask`, `StarRatingBar`, `RoomInfoPill`, `ListingCardItem`, `ListingReviewCard`, `PublishAdd`, `PublishAmenities`, `PublishNearbyPlaces`, `LeaveRequestBottomBar`, `Input`, `PublishSharedServices`, `AddEventItem`, `SwitchItem`, `BaseSimpleButton`, `BaseBottomSheet`, `ToggleChip`, `PaymentPaymentsItem`, `ListingClosePlacesCard`, `PublishAddSection`, `Sendable`, `BaseListingCardSection`, `Chip`, `HomeRoute`, `ChatBalloonLeft`, `BottomCTAButton`, `Color`, `GreenCTAButton`, `DropdownInput`, `Observation`, `.body`, `RoomieSectionHeader`, `RoundCheckBox`, `String`, `SendInviteBottomBar`, `MonthlyPaymentItem`, `NotifyPaymentBottomSheet`, `SharedPaymentBottomSheet`, `BaseCard`, `PlannerDestination`, `.body`, `HomeTabHeader`, `LocationInfoMessage`, `TaskItem`, `HomeScreen`, `.body`, `ProfileEmptyState`, `HomeScaffold`, `BaseGreenCard`, `ProfileSessionStartedState`, `ScreenTopBar`, `DeleteListingBottomSheet`, `PasswordRecoveryConfirmationScreen`, `UpdateRentBottomSheet`, `PublishAddText`, `PublishCurrentAddress`, `ExploreMap`, `HideListingItem`, `NavigationRouter`, `RoomieListItem`, `AddTaskItem`, `BottomSheetRoute`, `ChangePasswordScreen`, `ListingInfoSection`, `PasswordRecoveryScreen`, `BasicText`, `.body`, `.body`, `PublishAddPaymentSection`, `RateItem`?**
  _High betweenness centrality (0.102) - this node is a cross-community bridge._