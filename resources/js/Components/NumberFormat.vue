<template>
    <template v-if="type==='rupiah'">
        <span v-if="angka>0">Rp{{ new Intl.NumberFormat('id-ID').format(angka) }},- <span
                v-if="sentence">({{ terbilang(angka) }} rupiah)</span></span>
    </template>
    <template v-if="type==='saham'">
        <span v-if="angka>0">{{ new Intl.NumberFormat('id-ID').format(angka) }} <span
                v-if="sentence">({{ terbilang(angka) }})</span> lembar saham</span>
    </template>
    <template v-if="type==='persen'">
        <span v-if="angka>0">{{ new Intl.NumberFormat('id-ID').format(Math.round(angka)) }}% <span
                v-if="sentence">({{ terbilang(angka) }})</span> persen)</span>
    </template>
</template>

<script>

export default {
    name: "NumberFormat",
    props: {
        number: String||Number,
        type: String || Number,
        sentence: {
            default: true,
            type: Boolean
        }
    },
    methods: {
        terbilang(bilangan) {
            if (bilangan === null || bilangan === '') return
            if (bilangan === Infinity) return "tidak terhingga"
            if (typeof bilangan === 'number') {
                bilangan = '' + bilangan
            }
            bilangan = String(bilangan);
            let kaLimat = '';
            let i = 1
            let j = 0
            let subkaLimat = "";
            let kata1 = "";
            let kata2 = "";
            let kata3 = "";
            const angka = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];
            const kata = ['', 'Satu', 'Dua', 'Tiga', 'Empat', 'Lima', 'Enam', 'Tujuh', 'Delapan', 'Sembilan'];
            const tingkat = ['', 'Ribu', 'Juta', 'Miliar', 'Triliun'];
            const panjang_bilangan = bilangan.length;
            /* pengujian panjang bilangan */
            if (panjang_bilangan > 15) {
                kaLimat = "Diluar Batas";
                return kaLimat;
            }
            /* mengambil angka-angka yang ada dalam bilangan, dimasukkan ke dalam array */
            for (let i = 1; i <= panjang_bilangan; i++) {
                angka[i] = bilangan.substr(-(i), 1);
            }
            i = 1;
            j = 0;
            kaLimat = "";
            /* mulai proses iterasi terhadap array angka */
            while (i <= panjang_bilangan) {
                subkaLimat = "";
                kata1 = "";
                kata2 = "";
                kata3 = "";
                /* untuk Ratusan */
                if (angka[i + 2] != "0") {
                    if (angka[i + 2] == "1") {
                        kata1 = "Seratus";
                    } else {
                        kata1 = kata[angka[i + 2]] + " Ratus";
                    }
                }
                /* untuk Puluhan atau Belasan */
                if (angka[i + 1] != "0") {
                    if (angka[i + 1] == "1") {
                        if (angka[i] == "0") {
                            kata2 = "Sepuluh";
                        } else if (angka[i] == "1") {
                            kata2 = "Sebelas";
                        } else {
                            kata2 = kata[angka[i]] + " Belas";
                        }
                    } else {
                        kata2 = kata[angka[i + 1]] + " Puluh";
                    }
                }
                /* untuk Satuan */
                if (angka[i] != "0") {
                    if (angka[i + 1] != "1") {
                        kata3 = kata[angka[i]];
                    }
                }
                /* pengujian angka apakah tidak nol semua, lalu ditambahkan tingkat */
                if ((angka[i] != "0") || (angka[i + 1] != "0") || (angka[i + 2] != "0")) {
                    subkaLimat = kata1 + " " + kata2 + " " + kata3 + " " + tingkat[j] + " ";
                }
                /* gabungkan variabe sub kaLimat (untuk Satu blok 3 angka) ke variabel kaLimat */
                kaLimat = subkaLimat + kaLimat;
                i = i + 3;
                j = j + 1;
            }
            /* mengganti Satu Ribu jadi Seribu jika diperlukan */
            if ((angka[5] == "0") && (angka[6] == "0")) {
                kaLimat = kaLimat.replace("Satu Ribu", "Seribu");
            }
            return kaLimat.trim().toLowerCase()
        },
        parseIntOnly(str) {
            if ((typeof str === 'string' || str instanceof String)) {
                const numericStr = str.replace(/\D/g, "");
                return parseInt(numericStr, 10);
            }
            return str
        }
    },
    computed: {
        angka() {
            return this.parseIntOnly(this.number)
        }
    }
}
</script>

<style scoped>

</style>