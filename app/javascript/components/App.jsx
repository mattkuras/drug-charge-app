import React, {useState} from 'react'
import ChargeSearchForm from './search/chargeSearchForm'
const App = () => {

    const [drugCharge, setDrugCharge] = useState()
    
    const getDrugCharge = (charge) => {
        setDrugCharge(charge)
    }
    return(
        <div className='app'>
            <p>App component</p>
            <ChargeSearchForm getDrugCharge={getDrugCharge}/>
            {/* display results component */}
        </div>
    )
}

export default App