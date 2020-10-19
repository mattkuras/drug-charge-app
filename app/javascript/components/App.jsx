import React, {useState} from 'react'
import ChargeSearchForm from './search/chargeSearchForm'
import Results from './results/results'
import './App.css'
import Header from './header/header'

const App = () => {

    const [drugCharge, setDrugCharge] = useState()
    
    const getDrugCharge = (charge) => {
        setDrugCharge(charge)
    }

    
    return(
        <div className='app'>
            <Header />
            <ChargeSearchForm getDrugCharge={getDrugCharge}/>
            {drugCharge ? <Results results={drugCharge}/> : null}
        </div>
    )
}

export default App