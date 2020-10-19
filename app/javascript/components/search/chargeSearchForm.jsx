import React, {useState} from 'react'
import axios from 'axios'
import './chargeSearchForm.css'

const chargeSearchForm = (props) => {

    const [estado, setEstado] = useState('choose a state')
    const [drug, setDrug] = useState('')
    const [charge, setCharge] = useState('')

    const states = ['Choose a State', 'Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming']
    const stateOptions = states.map(state => (
        <option 
            name='state' 
            key={state}
            onChange={e => setEstado(e.target.value)}
        >
            {state}
        </option>
    ))

    const drugs = ['Choose a Drug', 'Cocaine', 'Marijuana', 'Heroin']
    const drugOptions = drugs.map(drug => (
        <option 
            name='drug' 
            key={drug}
        >
            {drug}
            </option>
    ))

    const charges = ['Choose a Charge', 'Possession', 'Sale', 'Trafficking']
    const chargeOptions = charges.map(charge => (
        <option 
            name='charge' 
            key={charge}
        >
            {charge}
        </option>
    ))


    const handleClick = (e) => {
    e.preventDefault()

        let drugCharge = {
            state: estado,
            drug: drug,
            charge: charge
        }
        axios.post('/drug_charge', drugCharge)
        .then(resp => props.getDrugCharge(resp.data))

    }

    return(
        <div className='form-container'>
            <form>
                <select className='state-select'
                    onChange={e => setEstado(e.target.value)}
                    value={estado}
                >
                    {stateOptions}                   
                </select>
                <select className='drug-select'
                    onChange={e => setDrug(e.target.value)}
                    value={drug}
                >
                    {drugOptions}
                </select>
                <select className='charge-select'
                    onChange={e => setCharge(e.target.value)}
                    value={charge}
                >
                    {chargeOptions}
                </select>
                <button onClick={handleClick}>submit</button>
            </form>
           
        </div>
    )
}

export default chargeSearchForm