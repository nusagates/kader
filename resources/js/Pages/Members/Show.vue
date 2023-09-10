<template>
    <AuthenticatedLayout>

        <Head title="Data Kader" />
        <v-card :title="'Data ' + member.legal_name">
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">
                        <h3>Data Diri</h3>
                        <v-table>
                            <tr>
                                <td style="width: 150px;">NIK</td>
                                <td v-text="member.nik" />
                            </tr>
                            <tr>
                                <td>Nama Panggilan</td>
                                <td v-text="member.initial" />
                            </tr>
                            <tr>
                                <td>Nomor Telpon</td>
                                <td v-text="member.phone" />
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td v-text="member.email" />
                            </tr>
                            <tr>
                                <td>Jenis Kelamin</td>
                                <td v-text="member.gender" />
                            </tr>
                            <tr>
                                <td>Status Pernikahan</td>
                                <td v-text="member.marital_status" />
                            </tr>
                            <tr>
                                <td>Tempat & Tgl Lahir</td>
                                <td>{{ member.pob }}/<date-format :date="member.dob"></date-format></td>
                            </tr>
                            <tr>
                                <td>Pekerjaan</td>
                                <td v-text="member.job" />
                            </tr>
                            <tr>
                                <td>Pendidikan</td>
                                <td v-text="member.education" />
                            </tr>
                            <tr>
                                <td>Pendapatan</td>
                                <td v-text="member.income" />
                            </tr>
                            <tr>
                                <td>Golongan Darah</td>
                                <td v-text="member.blood_group" />
                            </tr>
                            <tr>
                                <td>Kelurahan</td>
                                <td v-text="member.postal?.village" />
                            </tr>
                            <tr>
                                <td>RT/RW</td>
                                <td v-text="member.address.rt + '/' + member.address.rw" />
                            </tr>
                            <tr>
                                <td>Alamat</td>
                                <td v-text="member.address.street" />
                            </tr>
                        </v-table>
                    </v-col>
                    
                    <v-col cols="12" md="6">
                        
                        <v-sheet class='d-flex justify-space-between align-center'>
                            <h3>Data Anak</h3>
                            <v-btn color="success" @click="router.get('/member/create')">Tambah Anak</v-btn> 
                        </v-sheet>
                        
                    </v-col>
                    
                </v-row>
                
            </v-card-text>
        </v-card>
    </AuthenticatedLayout>
</template>

<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import DateFormat from '@/Components/DateFormat.vue';
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
    } else {
        form.patch('/member/' + form.id, {
            onFinish: () => { }
        })
    }
}
const props = defineProps(['jobs', 'postal', 'member']);
if (props.member !== undefined) {
    form = useForm(props.member)
}
</script>

<style lang="scss" scoped></style>