using System;
using System.Drawing;
using System.Windows.Forms;

namespace BibleQuiz.Models
{
    partial class GroupAttendance
    {

        private void InitializeComponent()
        {
            SuspendLayout();
            // 
            // GroupAttendance
            // 
            AutoSize = true;
            BackColor = Color.Black;
            Dock = DockStyle.Fill;
            GrowStyle = TableLayoutPanelGrowStyle.FixedSize;
            Margin = new Padding(5, 5, 5, 0);
            ResumeLayout(false);
            PerformLayout();
        }

        /**************************************************
         ********** CHECKBOX GROUP ************************
         **************************************************/

        private class CheckBoxGroup : CheckBox
        {
            internal CheckBoxGroup(long groupID, string groupName)
            {
                this.groupID = groupID;
                this.groupName = groupName;
                InitializeComponent();
            }

            //components
            private long groupID;
            private string groupName;

            private void InitializeComponent()
            {
                Appearance = Appearance.Button;
                AutoSize = true;
                BackColor = Color.White;
                Checked = false;
                Dock = DockStyle.Fill;
                Image = Properties.Resources.wrong;
                FlatStyle = FlatStyle.Flat;
                Font = new Font("Copperplate Gothic Bold", 16F, FontStyle.Regular, GraphicsUnit.Point);
                ForeColor = Color.Black;
                Margin = new Padding(5);
                MinimumSize = new Size(50, 25);
                Tag = groupID;
                Text = groupName;
                TextAlign = ContentAlignment.MiddleCenter;
                UseVisualStyleBackColor = false;
                CheckedChanged += new System.EventHandler(this.checkbox_CheckedChanged);
            }

            private void checkbox_CheckedChanged(object sender, EventArgs e)
            {
                if (Checked)
                {
                    Image = Properties.Resources.correct;
                }
                else
                {
                    Image = Properties.Resources.wrong;
                }
            }
        }

    }
}
