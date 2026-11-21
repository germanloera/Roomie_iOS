//
//  ListingLocationSection.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/10/26.
//

import SwiftUI
import MapKit

public struct ListingLocationSection: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var title: String
    public var visibleZone: String

    public init(
        title: String = "Ubicación",
        visibleZone: String = "Roma Norte, CDMX"
    ) {
        self.title = title
        self.visibleZone = visibleZone
    }

    public var body: some View {


        let initialPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 18.511961, longitude: -88.3013719),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            ))
        let place = Place(
            name: "Chetuslovakia",
            coordinate: CLLocationCoordinate2D(latitude: 18.5001, longitude: -88.2961))

        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.dmSans(.extraBold, size: 13))
                .lineSpacing(19.5 - 13)
                .kerning(0.65)
                .foregroundStyle(Color.roomie.mute)

            ZStack {

                Map(initialPosition: initialPosition) {
                    Marker(place.name, coordinate: place.coordinate).tag(place.id)
                }
                .mapStyle(.standard(elevation: .flat))
                .frame(maxWidth: .infinity)
                .frame(height: 112)
           
                 
            }
            .frame(maxWidth: .infinity)
            .frame(height: 112)
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))

            LocationInfoMessage(visibleZone: visibleZone)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


public struct LocationInfoMessage: View {
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    public var visibleZone: String
    public var fullMessage: String

    public init(
        visibleZone: String = "Roma Norte, CDMX",
        fullMessage: String? = nil
    ) {
        self.visibleZone = visibleZone
        self.fullMessage = fullMessage ?? "Zona visible: \(visibleZone). La dirección exacta se comparte únicamente al concretar una visita o entrevista con el titular."
    }

    private var highlightedText: AttributedString {
        let prefix = "Zona visible: \(visibleZone)"
        return fullMessage.highlight(words: [prefix], color: Color.roomie.ink)
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image("outline_lock_24")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)

            BasicText(highlightedText)
                .font(.dmSans(.semiBold, size: 12))
                .lineSpacing(16 - 12)
                .foregroundStyle(Color.roomie.mute)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(Color.roomie.sand.opacity(0.75))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    ZStack {
        RoomiePalette.ScreenBgBrush
            .ignoresSafeArea()

        VStack(spacing: 20) {
            ListingLocationSection()
        }
        .padding()
    }
}
