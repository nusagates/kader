import{_ as v}from"./AuthenticatedLayout-5036aa61.js";import{T as V,h as r,o as m,c as y,w as i,a,u as o,Z as x,f as h,g as b,d as k,t as P}from"./app-199fc9af.js";import"./ApplicationLogo-847e1354.js";import"./_plugin-vue_export-helper-c27b6911.js";const C={key:0,class:"my-2 text-center text-red"},B={__name:"Create",props:["user"],setup(p){const l=p,e=V({id:null,name:"",email:"",phone:"",password:"",password_confirmation:""}),u=()=>{e.id===null?e.post("/user",{onFinish:()=>{e.reset("name","phone","password","password_confirmation")}}):e.patch("/user/"+e.id,{onFinish:()=>{e.reset("name","phone","password","password_confirmation")}})};if(l.user!==void 0){const t=l.user;e.id=t.id,e.name=t.name,e.email=t.email,e.phone=t.phone}return(t,n)=>{const d=r("v-text-field"),c=r("v-card-text"),w=r("v-spacer"),f=r("v-btn"),_=r("v-card-actions"),g=r("v-card");return m(),y(v,null,{default:i(()=>[a(o(x),{title:"Register"}),a(g,{"min-width":"300","max-width":"350",class:"mx-auto"},{default:i(()=>[a(c,null,{default:i(()=>[a(d,{"prepend-icon":"mdi-account",density:"compact",label:"Nama Lengkap",modelValue:o(e).name,"onUpdate:modelValue":n[0]||(n[0]=s=>o(e).name=s),required:"",variant:"outlined","error-messages":o(e).errors.name},null,8,["modelValue","error-messages"]),a(d,{"prepend-icon":"mdi-email",density:"compact",label:"Email",modelValue:o(e).email,"onUpdate:modelValue":n[1]||(n[1]=s=>o(e).email=s),required:"",variant:"outlined","error-messages":o(e).errors.email},null,8,["modelValue","error-messages"]),a(d,{"prepend-icon":"mdi-phone",density:"compact",label:"Telpon",modelValue:o(e).phone,"onUpdate:modelValue":n[2]||(n[2]=s=>o(e).phone=s),required:"",variant:"outlined","error-messages":o(e).errors.phone},null,8,["modelValue","error-messages"]),o(e).id!==null?(m(),h("p",C,"Kosongi sandi jika tidak ingin mengubahnya")):b("",!0),a(d,{"prepend-icon":"mdi-lock","append-inner-icon":o(e).showPassword?"mdi-eye-off":"mdi-eye",density:"compact",label:"Sandi",modelValue:o(e).password,"onUpdate:modelValue":n[3]||(n[3]=s=>o(e).password=s),required:"",variant:"outlined",type:o(e).showPassword?"text":"password","onClick:appendInner":n[4]||(n[4]=s=>o(e).showPassword=!o(e).showPassword),"error-messages":o(e).errors.password},null,8,["append-inner-icon","modelValue","type","error-messages"]),a(d,{"prepend-icon":"mdi-lock","append-inner-icon":o(e).showPassword?"mdi-eye-off":"mdi-eye",density:"compact",label:"Konfirmasi Sandi",modelValue:o(e).password_confirmation,"onUpdate:modelValue":n[5]||(n[5]=s=>o(e).password_confirmation=s),required:"",variant:"outlined",type:o(e).showPassword?"text":"password","onClick:appendInner":n[6]||(n[6]=s=>o(e).showPassword=!o(e).showPassword),"error-messages":o(e).errors.password_confirmation},null,8,["append-inner-icon","modelValue","type","error-messages"])]),_:1}),a(_,null,{default:i(()=>[a(w),a(f,{onClick:u,color:"success",variant:"flat",disabled:o(e).processing,loading:o(e).processing},{default:i(()=>[k(P(o(e).id===null?"Simpan":"Perbarui"),1)]),_:1},8,["disabled","loading"])]),_:1})]),_:1})]),_:1})}}};export{B as default};