<template>
    <Head title="Data Kader" />
    <AuthenticatedLayout>
        <v-card>
            <v-sheet class="d-flex justify-space-between py-2 px-2 align-center">
                <v-card-title>
                    Data Kader
                </v-card-title>
                <v-btn color="success" @click="router.get('/member/create')">Tambah Kader</v-btn>
            </v-sheet>
            <v-divider />
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">
                        <v-text-field density='compact' placeholder="cari menggunakan nik, nama, telpon, atau email..."
                            @keydown.enter="router.get(('/member?search=' + form.search))" v-model='form.search' clearable
                            @click:clear="router.get('/member')"
                            />
                    </v-col>
                    <v-col cols="12" md="6"></v-col>
                </v-row>
                <v-sheet v-if="req.filter!==null" class='d-flex justify-start my-2 px-2'>
                    <p>Filter berdasar <strong>{{ req.filter }} {{ req.value }}</strong></p>
                    <v-icon @click="router.get('/member')" color="red">mdi-close</v-icon>
                </v-sheet>
                <v-table density="comfortable" class="border rounded-lg">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Telpon</th>
                            <th>Email</th>
                            <th>Pendidikan</th>
                            <th>Pekerjaan</th>
                            <th>Kelurahan</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user of members.data">
                            <td v-text="user.legal_name" />
                            <td v-text="user.phone" />
                            <td v-text="user.email" />
                            <td><v-chip @click="router.get('/member?filter=education&value=' + user.education)">{{user.education }}</v-chip></td>
                            <td><v-chip @click="router.get('/member?filter=job&value=' + user.job)">{{user.job }}</v-chip></td>
                            <td><v-chip @click="router.get('/member?filter=village&value=' + user.postal.village)">{{user.postal.village }}</v-chip></td>
                            <td>
                                <v-icon @click="router.get(`/member/${user.id}/edit`)">mdi-square-edit-outline</v-icon>
                            </td>
                        </tr>
                    </tbody>
                </v-table>
                <v-sheet class='d-flex justify-space-between my-3 align-center'>
                    <div>{{ members.from }} - {{ members.to }} dari {{ members.total }} kader</div>
                    <v-pagination @update:model-value="router.get('/member?page=' + $event)" density="compact"
                        :length="members.last_page" v-model="members.current_page" total-visible="2"></v-pagination>
                </v-sheet>
            </v-card-text>
        </v-card>
    </AuthenticatedLayout>
</template>

<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { router, Head, useForm } from '@inertiajs/vue3';

const props = defineProps(['members', 'search', 'req']);
const form = useForm({
    search: props.search
})
</script>

<style lang="scss" scoped></style>