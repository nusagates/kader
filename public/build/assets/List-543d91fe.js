import{r as e,o as a,c as b,w as n,a as o,d as s,u as _,O as d,b as t,f as u,l as k,F as g,t as c}from"./app-f84a3f77.js";const y=t("thead",null,[t("tr",null,[t("th",null,"Nama"),t("th",null,"Telpon"),t("th",null,"Email"),t("th",null,"Aksi")])],-1),B=["textContent"],N=["textContent"],w=["textContent"],D={__name:"List",props:["users"],setup(i){return(T,r)=>{const m=e("v-card-title"),p=e("v-btn"),v=e("v-sheet"),f=e("v-icon"),x=e("v-table"),h=e("v-card-text"),C=e("v-card");return a(),b(C,null,{default:n(()=>[o(v,{class:"d-flex justify-space-between py-2 px-2 align-center"},{default:n(()=>[o(m,null,{default:n(()=>[s(" Data Kader ")]),_:1}),o(p,{color:"success",onClick:r[0]||(r[0]=l=>_(d).get("/user/create"))},{default:n(()=>[s("Tambah Kader")]),_:1})]),_:1}),o(h,null,{default:n(()=>[o(x,{density:"comfortable",class:"border rounded-lg"},{default:n(()=>[y,t("tbody",null,[(a(!0),u(g,null,k(i.users.data,l=>(a(),u("tr",null,[t("td",{textContent:c(l.name)},null,8,B),t("td",{textContent:c(l.phone)},null,8,N),t("td",{textContent:c(l.email)},null,8,w),t("td",null,[o(f,{onClick:V=>_(d).get(`/user/${l.id}/edit`)},{default:n(()=>[s("mdi-square-edit-outline")]),_:2},1032,["onClick"])])]))),256))])]),_:1})]),_:1})]),_:1})}}};export{D as default};