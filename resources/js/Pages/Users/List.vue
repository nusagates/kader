<template>
    <v-card>
        <v-sheet class="d-flex justify-space-between py-2 px-2 align-center">
            <v-card-title>
                Data Kader
            </v-card-title>
            <v-btn color="success" @click="router.get('/user/create')">Tambah Kader</v-btn>
        </v-sheet>
        <v-card-text>
            <v-table density="comfortable" class="border rounded-lg">
                <thead>
                    <tr>
                        <th>Nama</th>
                        <th>Telpon</th>
                        <th>Email</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user of users.data">
                        <td v-text="user.name" />
                        <td v-text="user.phone" />
                        <td v-text="user.email" />
                        <td>
                            <v-icon @click="router.get(`/user/${user.id}/edit`)">mdi-square-edit-outline</v-icon>
                        </td>
                    </tr>
                </tbody>
            </v-table>
        </v-card-text>
    </v-card>
</template>

<script setup>
import { router } from '@inertiajs/vue3';

defineProps(['users'])
</script>