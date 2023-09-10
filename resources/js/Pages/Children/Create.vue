<template>
    <AuthenticatedLayout>

        <Head title="Tambah Anak" />
        <v-card :title="'Tambah Anak '+member.legal_name">
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">
        
                        <v-text-field density='compact' label='Nama Lengkap' v-model='form.name'
                            :error-messages="form.errors.name" />
                            <v-text-field density='compact' label='Tanggal Lahir' v-model='form.dob'
                                :error-messages="form.errors.dob" type="date" />
                        <v-select density='compact'
                            :items="['Tidak Sekolah', 'RA', 'TK', 'MI', 'SD', 'SLTP', 'SLTA', 'D1', 'D2', 'D3', 'D4', 'S1', 'S2', 'S3']"
                            v-model="form.education" label="Pendidikan Terakhir" />
                            <v-sheet class="d-flex justify-end">
                            <v-btn @click="submit" :disabled="form.processing" :loading="form.processing" color="success"
                                variant="flat">{{ form.id===null?'Simpan':'Perbarui' }}</v-btn>
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
    member_id:props.member.id,
    id: null,
    name: '',
    dob: '',
    education: 'SLTA',
})

const submit = () => {
    if (form.id === null) {
        form.post(`/member/${form.member_id}/children`, {
            onFinish: () => { }
        })
    }else{
        form.patch('/member/'+form.id, {
            onFinish: () => { }
        })
    }
}
const props = defineProps(['jobs', 'postal', 'member']);

</script>

<style lang="scss" scoped></style>