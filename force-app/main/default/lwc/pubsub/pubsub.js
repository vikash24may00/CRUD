// pubsub.js
const events = {};

const subscribe = (eventName, callback) => {
    if (!events[eventName]) {
        events[eventName] = [];
    }
    events[eventName].push(callback);
};

const unsubscribe = (eventName, callback) => {
    if (events[eventName]) {
        events[eventName] = events[eventName].filter(listener => listener !== callback);
    }
};

const publish = (eventName, payload) => {
    if (events[eventName]) {
        events[eventName].forEach(listener => {
            try {
                listener.call(null, payload);
            } catch (error) {
                console.error(error);
            }
        });
    }
};

export { subscribe, unsubscribe, publish };