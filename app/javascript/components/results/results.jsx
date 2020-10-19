import React from 'react'
import './results.css'

const Results = (props) => {

    return(
        <div className='results-container'>
            <p>{props.results}</p>
        </div>
    )
}

export default Results