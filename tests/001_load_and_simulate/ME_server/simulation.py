
# coding: utf-8

# In[1]:


from pyfmi import load_fmu
from pyfmi.fmi_coupled import CoupledFMUModelME2


# In[ ]:


# Load CSV reader FMU
csv_reader = load_fmu('csv_reader/jonathan.fmu', log_level=7)
csv_reader.setup_experiment(start_time=0, stop_time=20)

# In[ ]:


# Create the Master algorithm
master = CoupledFMUModelME2([csv_reader], [])

# Launch the simulation
results = master.simulate(final_time=23.0)
csv_reader.terminate()


# In[ ]:


# Plot the results
import matplotlib.pyplot as plt

plt.figure(figsize=(10, 3))
plt.plot(results[csv_reader]["time"], results[csv_reader]["y"])
plt.ylabel("Data from the CSV file")
plt.xlabel("Time")
plt.show()

