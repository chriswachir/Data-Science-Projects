import streamlit as st
import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import plotly
import warnings
warnings.filterwarnings('ignore')

# Configuration
st.set_option('deprecation.showPyplotGlobalUse', False)
st.set_option('deprecation.showfileUploaderEncoding', False)

title = st.markdown('# DATA VISUALIZATION APPLICATION')

# Add a sidebar  

st.sidebar.subheader('Visualiation Setting')

# setup file upload 
uploaded_file = st.sidebar.file_uploader(label='Upload your CSV or Excel File', 
	type=['csv', 'xlsx'])

global df
if uploaded_file is not None:
	print('hello')
	try:
		df = pd.read_csv(uploaded_file)
	except Exception as e:
		print(e)
		df = pd.read_excel(uploaded_file)
		
global numeric_columns
global categorical_columns
try: 
	st.write(df)
	numeric_columns = list(df.select_dtypes(exclude=['object']).columns)
	categorical_columns = list(df.select_dtypes(include=['object']).columns)
except Exception as e:
	st.write('Please upload file to the application')

# add select widget to the sidebar 

chart_select = st.sidebar.selectbox(
	label='Select the chart type',
	options=['Scatterplots', 'Lineplots', 'Histogram','Boxplot(Single Numeric variable)',
	'Boxplot(by one categorical variable)', "Boxplot(by 2 categorical variable",
	'Barplot', 'Countplot', 'Pieplot']
	)
if chart_select == 'Scatterplots':
	st.sidebar.subheader('Scatterplot Settings')
	try:
		x_values = st.sidebar.selectbox('X axis', options=numeric_columns)
		y_values = st.sidebar.selectbox('Y axis', options=numeric_columns)
		Color = st.sidebar.selectbox('Color', options=categorical_columns)
		plot = px.scatter(data_frame=df, x=x_values, y=y_values, color=Color, title='Scatterplot of '+x_values+ ' and '+y_values)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)
elif chart_select == 'Histogram':
	st.sidebar.subheader('Histogram Settings')
	try:
		x_values = st.sidebar.selectbox('X axis', options=numeric_columns)
		Color = st.sidebar.selectbox('Color', options=categorical_columns)
		plot = px.histogram(data_frame=df, x=x_values, color=Color, title='Histogram of '+x_values)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)
elif chart_select == 'Boxplot(Single Numeric variable)':
	st.sidebar.subheader('Boxplot Settings')
	try:
		y_values = st.sidebar.selectbox('Y axis', options=numeric_columns)
		plot = px.box(data_frame=df, y=y_values, title='Boxplot of '+y_values)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)
elif chart_select == 'Boxplot(by one categorical variable)':
	st.sidebar.subheader('Boxplot Settings')
	try:
		x_values = st.sidebar.selectbox('X axis', options=categorical_columns)
		y_values = st.sidebar.selectbox('Y axis', options=numeric_columns)
		plot = px.box(data_frame=df, x=x_values, y=y_values, title='Boxplot of '+y_values+ ' by '+y_values)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)
elif chart_select == 'Boxplot(by 2 categorical variable':
	st.sidebar.subheader('Boxplot Settings')
	try:
		x_values = st.sidebar.selectbox('X axis', options=categorical_columns)
		y_values = st.sidebar.selectbox('Y axis', options=numeric_columns)
		Color = st.sidebar.selectbox('Color', options=categorical_columns)
		plot = px.box(data_frame=df, x=x_values, y=y_values, color=Color, title='Boxplot of '+y_values+ ' by '+x_values+ ' and '+Color)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)

elif chart_select == 'Barplot':
	st.sidebar.subheader('Barplot Settings')
	try:
		x_values = st.sidebar.selectbox('X axis', options=categorical_columns)
		y_values = st.sidebar.selectbox('Y axis', options=numeric_columns)
		Color = st.sidebar.selectbox('Color', options=categorical_columns)
		plt.figure(figsize=(10, 4))
		plot = sns.barplot(data=df, x=x_values, y=y_values, hue=Color)
		plt.title('Bar Plot of '+y_values+ ' by '+x_values)
		plt.xticks(rotation=90)
		plt.grid(True)
		# display the chart
		st.pyplot()
	except Exception as e:
		print(e)
elif chart_select == 'Pieplot':
	st.sidebar.subheader('Pieplot Settings')
	try:
		x_values = st.sidebar.selectbox('Categorical variable', options=categorical_columns)
		y_values = st.sidebar.selectbox('Continous Variable', options=numeric_columns)
		plot = px.pie(data_frame=df, names=x_values, values=y_values, title='Pie Chart of '+y_values+ ' by '+x_values)
		# display the chart
		st.plotly_chart(plot)
	except Exception as e:
		print(e)
elif chart_select == 'Countplot':
	st.sidebar.subheader('Countplot Settings')
	try:
		x_values = st.sidebar.selectbox('Variable', options=categorical_columns)
		plt.figure(figsize=(8, 4))
		plot = sns.countplot(data=df, x=x_values)
		plt.title('Frequency Distribution Plot '+x_values)
		plt.xticks(rotation=90)
		plt.grid(True)
		# display the chart
		st.pyplot()
	except Exception as e:
		print(e)






