from flask import Flask, render_template, jsonify, request
from SF2_loader import DAWApp
import threading

app = Flask(__name__)
daw_app = DAWApp(headless=True)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/sf2_files')
def get_sf2_files():
    return jsonify(daw_app.sf2_files)

@app.route('/presets')
def get_presets():
    sf2_file = request.args.get('sf2_file')
    bank = int(request.args.get('bank', 0))
    presets = daw_app.get_preset_names(sf2_file)
    return jsonify([preset for preset in presets if int(preset[0].split(':')[0]) == bank])

@app.route('/load_instrument', methods=['POST'])
def load_instrument():
    try:
        data = request.json
        # Check for necessary keys and handle missing data
        sf2_file = data.get('sf2_file')
        bank = data.get('bank')
        preset = data.get('preset')
        
        if not sf2_file or bank is None or preset is None:
            return jsonify({"status": "error", "message": "Missing required data"}), 400
        
        # Convert bank and preset to integers safely
        try:
            bank = int(bank)
            preset = int(preset)
        except ValueError:
            return jsonify({"status": "error", "message": "Invalid bank or preset value"}), 400

        daw_app.load_sf2_instrument(f"/opt/sf2loader/sf2/{sf2_file}", bank, preset)
        return jsonify({"status": "success"})
    
    except Exception as e:
        # Catch unexpected errors
        return jsonify({"status": "error", "message": str(e)}), 500

def run_flask():
    app.run(host='0.0.0.0', port=5000)

if __name__ == '__main__':
    flask_thread = threading.Thread(target=run_flask)
    flask_thread.start()
    daw_app.run()  # Assuming this runs in the background

