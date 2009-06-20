
import javax.swing.table.AbstractTableModel;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author daniele
 */
class DriverTableModel extends AbstractTableModel{

    Log_viewerImpl logger;

    String[] columns = {"Position", "Name", "Team", "Lap", "Segment", "Best lap (ms)"};

    public DriverTableModel(Log_viewerImpl logger) {
        this.logger = logger;
    }

    public int getRowCount() {
        return logger.getNumDrivers();
    }

    public int getColumnCount() {
        return columns.length;
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0: return rowIndex;
            case 1: return logger.getDriver(rowIndex).getName();
            case 2: return logger.getDriver(rowIndex).getTeam();
            case 3: return logger.getDriver(rowIndex).getCurrentLap();
            case 4: if(logger.getDriver(rowIndex).isAtBox()) {
                        return "box";
                    }
                    return logger.getDriver(rowIndex).getCurrentSegment();
            case 5: if(logger.getDriver(rowIndex).getCurrentLap() != 0){
                        return logger.getDriver(rowIndex).getBestLap();
                    }
                    return 0;
        }
        return null;
    }

    @Override
    public String getColumnName(int columnIndex){
        return columns[columnIndex];
    }

}
