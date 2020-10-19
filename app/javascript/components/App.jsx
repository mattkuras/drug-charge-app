import React, {useState} from 'react'
import ChargeSearchForm from './search/chargeSearchForm'
import Results from './results/results'
import './App.css'
const App = () => {

    const [drugCharge, setDrugCharge] = useState()
    
    const getDrugCharge = (charge) => {
        setDrugCharge(charge)
    }
    return(
        <div className='app'>
            <ChargeSearchForm getDrugCharge={getDrugCharge}/>
            <Results results={drugCharge}/>
        </div>
    )
}

export default App