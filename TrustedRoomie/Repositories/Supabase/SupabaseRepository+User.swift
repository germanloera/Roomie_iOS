//
//  SupabaseRepository+User.swift
//  TrustedRoomie
//
//  Created by Senior iOS Architect on 11/26/26.
//

import Foundation
import Supabase

private struct UserUpdatePayload: Encodable {
    let email: String
    let name: String
    let nickname: String?
    let phone: String?
}

public extension SupabaseRepository {
    /// Consulta la tabla `users` para obtener los datos del usuario actual (registro único).
    func getCurrentUserData() async throws -> User {
        let client = await provider.awaitClient()
        let user: User = try await client
            .from("users")
            .select()
            .single()
            .execute()
            .value
        return user
    }

    /// Filtra por `user_id` en la tabla `emergency_contacts` y retorna la lista de contactos.
    /// Si no existen registros, retorna dos contactos vacíos por defecto (idéntico al comportamiento en Android).
    func getEmergencyContacts(userId: String) async throws -> [EmergencyContact] {
        let client = await provider.awaitClient()
        let contacts: [EmergencyContact] = try await client
            .from("emergency_contacts")
            .select()
            .eq("user_id", value: userId)
            .execute()
            .value

        if contacts.isEmpty {
            return [
                EmergencyContact(name: "", relation: "", phone: ""),
                EmergencyContact(name: "", relation: "", phone: "")
            ]
        }
        return contacts
    }

    /// Actualiza los datos personales del usuario en la tabla `users`.
    func updateUserData(_ newData: User) async throws {
        let client = await provider.awaitClient()
        let payload = UserUpdatePayload(
            email: newData.email,
            name: newData.name,
            nickname: newData.nickname,
            phone: newData.phone
        )
        try await client
            .from("users")
            .update(payload)
            .eq("id", value: newData.id)
            .execute()
    }

    /// Realiza un upsert de los contactos de emergencia en la tabla `emergency_contacts`.
    func updateEmergencyContact(_ contacts: [EmergencyContact]) async throws {
        let client = await provider.awaitClient()
        try await client
            .from("emergency_contacts")
            .upsert(contacts)
            .execute()
    }
}
