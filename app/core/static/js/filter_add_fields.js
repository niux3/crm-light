(()=>{
    let fieldsets = document.querySelectorAll('.addRows'),
        addNewFields = (fieldset, groups) => fieldset.insertAdjacentHTML("beforeend", groups[groups.length - 1].outerHTML),
        changeName = fieldset =>{
            fieldset.querySelectorAll('.group').forEach((g, indexGroup)=>{
                let names = ["data_select", "compare", "value", "date", "custom", "begin", "end"]
                names.map(n => g.querySelector(`*[name^="${n}"]`)).forEach((input, indexField) => { 
                    if(input !== null){
                        input.name = `${names[indexField]}_${indexGroup}`
                        input.id = `${names[indexField]}_${indexGroup}`
                    }
                })
            })
        }

    fieldsets.forEach(( fieldset, i ) =>{
        let groups = fieldset.querySelectorAll('.group'),
            tplButton = `
            <div class="cell medium-3 flex-container align-bottom">
                <button type="button" class="add button primary" style="width:100%">ajouter<button>
            </div>`

        groups[groups.length - 1].insertAdjacentHTML('beforeend', tplButton)
        fieldset.addEventListener('pointerdown', e =>{
            if(e.target.classList.contains('add') && e.target.nodeName.toLowerCase() === 'button'){
                addNewFields(fieldset, groups)
                changeName(fieldset)
            }
        })
    })
})()
