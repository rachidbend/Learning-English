import { useState } from 'react';

const Home = ({ onStartLearning }) => {
    return (
        <div className="flex flex-col items-center justify-center space-y-8 py-8">
            <div className="text-center space-y-4">
                <h2 className="text-3xl font-bold text-gray-900">
                    Oxford 3000
                </h2>
                <p className="text-lg text-gray-600 leading-relaxed max-w-xs mx-auto">
                    Learn the 3000 most common English words
                </p>
            </div>

            <div className="bg-white rounded-2xl p-6 shadow-md w-full space-y-3">
                <div className="flex justify-between items-center">
                    <span className="text-gray-600 font-medium">Batch 1</span>
                    <span className="bg-blue-100 text-blue-800 text-sm font-semibold px-3 py-1 rounded-full">
                        100 Words
                    </span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2.5">
                    <div className="bg-primary h-2.5 rounded-full w-0"></div>
                </div>
                <p className="text-sm text-gray-500 text-right">0% Complete</p>
            </div>

            <div className="w-full pt-4">
                <button
                    className="w-full bg-primary hover:bg-blue-600 text-white font-bold py-4 px-6 rounded-xl shadow-lg transform transition active:scale-95 flex items-center justify-center text-xl"
                    onClick={onStartLearning}
                >
                    Start Learning
                </button>
            </div>

            <p className="text-sm text-gray-400 text-center mt-8">
                Mobile Proof of Concept v0.1
            </p>
        </div>
    )
}

export default Home
