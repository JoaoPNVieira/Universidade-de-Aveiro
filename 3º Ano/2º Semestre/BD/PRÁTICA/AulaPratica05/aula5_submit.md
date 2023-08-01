# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
(π Pname, Pnumber (project) ⨝ Pnumber = Pno works_on) ⨝ Essn = Ssn (π Fname, Lname, Ssn (employee))
```


### *b)* 

```
π Fname, Minit, Lname, employee.Ssn (employee ⨝ employee.Super_ssn = supervisor.Ssn (ρ supervisor (π Ssn (σ Fname = 'Carlos' and Minit = 'D' and Lname = 'Gomes' (employee)))))
```


### *c)* 

```
γ Pname, Pnumber; sum(works_on.Hours) -> TotalHours (project ⨝ project.Pnumber = works_on.Pno (works_on))
```


### *d)* 

```
π Fname, Minit, Lname (σ Dno = 3 ∧ Hours > 20 ∧ Pname = 'Aveiro Digital' (employee ⨝ Dno = Dnumber department ⨝ Dnumber = Dnum project ⨝ Pnumber = Pno works_on))
```


### *e)* 

```
π Fname, Minit, Lname (σ Pno=null (employee⟕Ssn=Essn works_on))
```


### *f)* 

```
π Dname, med_Salary ((γ Dno; avg(Salary)->med_Salary (σ Sex='F' employee))⨝Dno=Dnumber department)
```


### *g)* 

```
π Fname, Minit, Lname (σ Depend_numb>2 (γ Fname, Minit, Lname, Ssn; count(Essn)->Depend_numb (employee⨝Ssn=Essn dependent)))
```


### *h)* 

```
π Fname, Minit, Lname (σ Depend_numb=0 (γ Fname, Minit, Lname, Ssn; count(Essn)->Depend_numb (employee⨝Ssn=Mgr_ssn department⟕Ssn=Essn dependent)))
```


### *i)* 

```
π Fname, Minit, Lname, Address ((employee⨝Ssn=Essn works_on⨝Pno=Pnumber (σ Plocation='Aveiro' project))⨝Dno=Dnumber  (σ Dlocation!='Aveiro' (department⟕dept_location)))
```


## ​Problema 5.2

### *a)*

```
(fornecedor) - π nif,fornecedor.nome,fax,endereco,condpag,tipo (((fornecedor) ⨝ fornecedor.nif=encomenda.fornecedor (encomenda)))
```

### *b)* 

```
γ item.codProd;avg(item.unidades)-> media_unidades (item)
```


### *c)* 

```
γ avg(num_occurences)->avg_num_prod (γ item.numEnc; count(item.codProd)->num_occurences (item))
```


### *d)* 

```
π item.codProd,item.unidades,encomenda.fornecedor ((item) ⨝ item.numEnc = encomenda.numero (encomenda))
```


## ​Problema 5.3

### *a)*

```
π numUtente, nome (σ numPresc=null (π numUtente, nome (paciente) ⨝ prescricao))
```

### *b)* 

```
γ medico.especialidade; count(prescricao.numPresc) -> num_prescricoes (π medico.especialidade,prescricao.numPresc  (prescricao ⨝ numSNS=numMedico medico))
```


### *c)* 

```
γ count(prescricao.numPresc) -> num_processadas_por_farmacias (σ prescricao.farmacia!=null prescricao)
```


### *d)* 

```
π farmaco.nome,farmaco.formula (σ presc_farmaco.numPresc= null (σ farmaco.numRegFarm=906 (farmaco) ⟕ nome=nomeFarmaco presc_farmaco))
```

### *e)* 

```
π farmacia, numRegFarm, num (γ farmacia, numRegFarm; count(prescricao.numPresc) -> num (σ farmacia!=null (π prescricao.numPresc, farmacia (prescricao)) ⨝ prescricao.numPresc=presc_farmaco.numPresc (presc_farmaco)))
```

### *f)* 

```
π numUtente (σ num>1 (π numUtente,num (γ numUtente; count(numUtente) -> num (π numUtente, numMedico, num (γ numUtente, numMedico; count(numUtente) -> num prescricao)))))
```
