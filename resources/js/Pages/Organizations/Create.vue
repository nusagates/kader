<template>
    <AuthenticatedLayout>

        <Head title="Tambah Anak" />
        <v-card :title="'Tambah Anak ' + member.legal_name">
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">

                        <v-select density='compact' :items="orgs" v-model="form.name" label="Nama Organisasi" :error-messages="form.errors.name"/>
                        <v-select density='compact' :items="['Anak Ranting', 'Ranting', 'MWC', 'PAC', 'PC', 'PW', 'PP']"
                            v-model="form.level" label="Tingkat Kepengurusan" :error-messages="form.errors.level"/>
                        <v-select density='compact' :items="orgTitle" v-model="form.title" label="Jabatan" :error-messages="form.errors.title"/>
                        <v-sheet class='d-flex justify-space-between'>
                            <v-text-field density='compact' label='Tanggal Mulai' v-model='form.started_at' type="date"/>
                            <v-text-field density='compact' label='Tanggal Berakhir' v-model='form.finished_at' type="date"/>
                        </v-sheet>
                        <v-sheet class="d-flex justify-end">
                            <v-btn @click="submit" :disabled="form.processing" :loading="form.processing" color="success"
                                variant="flat">{{ form.id === null ? 'Simpan' : 'Perbarui' }}</v-btn>
                        </v-sheet>
                    </v-col>
                    <v-col cols="12" md="6">


                    </v-col>
                </v-row>
            </v-card-text>
        </v-card>
    </AuthenticatedLayout>
</template>

<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { useForm, Head } from '@inertiajs/vue3';
let form = useForm({
    member_id: props.member.id,
    id: null,
    name: '',
    title: 'Anggota',
    level: 'Ranting',
    started_at: null,
    finished_at: null,
})
const orgs = ["Nahdlatul Ulama", "Muslimat NU", "GP Ansor", "Fatayat NU", "IPNU", "IPPNU", "LPNU", "LP Ma'arif NU", "LAZISNU", "LDNU", "LTMNU", "LDKNU", "ISHARINU", "PERGUNU", "RMI NU", "PAGAR NUSA", "GKMNU"];
const orgTitle = ["Anggota", "Mustasyar", "Rois Syuriah", "Katib Syuriah", "Ketua Tanfidziyah", "A'wan", "Ketua", "Wakil Ketua I", "Wakil Ketua II", "Wakil Ketua III", "Wakil Ketua IV", "Wakil Ketua V", "Sekretaris", "Wakil Sekretaris I", "Wakil Sekretaris II", "Wakil Sekretaris III", "Wakil Sekretaris IV", "Wakil Sekretaris V", "Bendahara", "Penasehat"];
const submit = () => {
    if (form.id === null) {
        form.post(`/member/${form.member_id}/organization`, {
            onFinish: () => { }
        })
    } else {
        form.patch('/member/' + form.id, {
            onFinish: () => { }
        })
    }
}
const props = defineProps(['jobs', 'postal', 'member']);

</script>

<style lang="scss" scoped></style>