//
//  Map.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI
import MapKit // Descomentar al integrar MapKit nativo de Apple

/// Vista interactiva de mapa para exploración de habitaciones.
/// Equivalente en SwiftUI al composable `Map` de Jetpack Compose (`ui.components.explore`).
///
/// NOTA DE MIGRACIÓN (Regla 7):
/// La implementación con Apple Maps (MapKit) se encuentra traducida y comentada abajo
/// para ser activada en la siguiente fase de desarrollo de mapas iOS.
public struct MapView: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?
    
    @State private var selectedPlaceID: UUID?
    @State private var showCard = false

    public var onListButtonTap: (() -> Void)?
    public var onCardTap: (() -> Void)?

    public init(
       onListTap: (() -> Void)? = nil,
       onCardTap: (() -> Void)? = nil
    ) {
        self.onListButtonTap = onListTap
        self.onCardTap = onCardTap
    }

    public var body: some View {
        ZStack {
                
            let initialPosition = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 18.511961, longitude: -88.3013719),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
            let place = Place(name: "Chetuslovakia", coordinate: CLLocationCoordinate2D(latitude: 18.5001, longitude: -88.2961))
            
            
            Map(initialPosition: initialPosition, selection: $selectedPlaceID) {
                Marker(place.name, coordinate: place.coordinate).tag(place.id)
            }
                .mapStyle(.standard(elevation: .flat))
            .mapControls {
                MapCompass()
                MapScaleView()
            }
            .ignoresSafeArea()
            .onChange(of: selectedPlaceID) { oldValue, newValue in
      
              if newValue != nil {
                  withAnimation(.easeIn(duration: 0.35)) {
                      showCard = true
                  }
                } else if oldValue != nil{
                    withAnimation(.easeOut(duration: 0.35)) {
                        showCard = false
                    }
                }
            }
           
            
            // =========================================================================
            // Capa de Controles y Tarjeta superpuesta (ConstraintLayout en Compose)
            VStack(spacing: 0) {
                // Top Search Bar
                InputWithIcon(
                    placeHolder: "Buscar habitaciones o zonas...",
                    iconName: "outline_search_24"
                )
                .padding(.horizontal, 10)
                .padding(.top, 10)

                // Chips de filtro y cambio a vista de lista
                HStack {
                    GlassChip(text: "3 Results")

                    Spacer()

                    Button {
                        if let onListButtonTap {
                            onListButtonTap()
                        }
                    } label: {
                        GlassChip(
                            text: "Lista",
                            iconName: "ic_list_lines"
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 10)
                .padding(.top, 12)

                Spacer()

                if showCard {
                    MapListingCard(
                        item: ListingCardItem(
                            title: "Cuarto luminoso en la Roma Norte",
                            location: "Roma Norte, CDMX",
                            price: "$6,500",
                            roommateCount: "4 roomies",
                            description: "12 m2, baño propio",
                            photoName: "listing_placeholder_large"
                        )
                    ) {
                        if let onCardTap {
                            onCardTap()
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(1)
                    
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        Map()
    }
}
