<template>
    <AuthenticatedLayout>

        <Head title="Tambah Kader" />
        <v-card title="Tambah Kader">
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">
                        <v-text-field density='compact' label='NIK' v-model='form.nik' :error-messages="form.errors.nik" />
                        <v-text-field density='compact' label='Nama Lengkap' v-model='form.legal_name'
                            :error-messages="form.errors.legal_name" />
                        <v-text-field density='compact' label='Nama Panggilan' v-model='form.initial' />
                        <v-text-field density='compact' label='Telpon' v-model='form.phone' :error-messages="form.errors.phone"/>
                        <v-text-field density='compact' label='Email' v-model='form.email' />
                        <v-select density='compact' :items="['Pria', 'Wanita']" v-model="form.gender"
                            label="Jenis Kelamin" />
                        <v-select density='compact' :items="['Belum Menikah', 'Menikah', 'Cerai Hidup', 'Cerai Mati']"
                            v-model="form.marital_status" label="Status Pernikahan" />
                        <v-select density='compact'
                            :items="['Tidak Sekolah', 'RA', 'TK', 'MI', 'SD', 'SLTP', 'SLTA', 'D1', 'D2', 'D3', 'D4', 'S1', 'S2', 'S3']"
                            v-model="form.education" label="Pendidikan Terakhir" />
                    </v-col>
                    <v-col cols="12" md="6">
                        <v-select clearable density='compact' :items="['A', 'B', 'AB', 'O']" v-model="form.blood_group"
                            label="Golongan Darah" />
                        <v-sheet class="d-flex justify-space-between">
                            <v-text-field density='compact' label='Tempat Lahir' v-model='form.pob'
                                :error-messages="form.errors.pob" />
                            <v-text-field density='compact' label='Tanggal Lahir' v-model='form.dob'
                                :error-messages="form.errors.dob" type="date" />
                        </v-sheet>
                        <v-select density='compact' :items="jobs" v-model="form.job" label="Pekerjaan" item-title="name"
                            item-value="name" />
                        <v-text-field density='compact' label='Pendapatan Per Bulan' v-model='form.income'
                            hint="isikan pendapatan rata-rata" />
                        <v-select clearable density='compact' :items="postal" item-title="village" return-object
                            v-model="form.postal" label="Kelurahan" :error-messages="form.errors.postal"/>
                        <v-sheet class="d-flex justify-space-between">
                            <v-text-field density='compact' label='RT' v-model='form.address.rt' />
                            <v-text-field density='compact' label='RW' v-model='form.address.rw' />
                        </v-sheet>
                        <v-textarea density='compact' label='Alamat' v-model='form.address.street' />

                        <v-sheet class="d-flex justify-end">
                            <v-btn @click="submit" :disabled="form.processing" :loading="form.processing" color="success"
                                variant="flat">{{ form.id===null?'Simpan':'Perbarui' }}</v-btn>
                        </v-sheet>
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
    id: null,
    nik: '',
    legal_name: '',
    display_name: '',
    initial: '',
    phone: '',
    email: '',
    gender: 'Pria',
    marital_status: 'Menikah',
    pob: '',
    dob: '',
    job: '',
    education: 'SLTA',
    income: 0,
    blood_group: null,
    postal: null,
    address: {
        rt: '',
        rw: '',
        street: ''
    },
    status: 'active'
})

const submit = () => {
    if (form.id === null) {
        form.post('/member', {
            onFinish: () => { }
        })
    }else{
        form.patch('/member/'+form.id, {
            onFinish: () => { }
        })
    }
}
const props = defineProps(['jobs', 'postal', 'member']);
if(props.member!==undefined){
    form = useForm(props.member)
}
</script>

<style lang="scss" scoped></style>