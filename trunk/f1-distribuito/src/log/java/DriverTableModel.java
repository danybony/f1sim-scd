
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

    String[] columns = {"Position", "Name", "Team", "Lap", "Segment", "Speed", "Top Speed", "Best lap"};

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
            case 5: return logger.getDriver(rowIndex).getSpeed();
            case 6: return logger.getDriver(rowIndex).getMaxSpeed();
            case 7: if(logger.getDriver(rowIndex).getCurrentLap() != 0){
                        int min = (int) (logger.getDriver(rowIndex).getBestLap() / 60000);
                        int sec = (int) ((logger.getDriver(rowIndex).getBestLap() / 1000) % 60);
                        int ms  = (int) (logger.getDriver(rowIndex).getBestLap() % 1000);
                        if(min != 0){
                            return ""+ min + ":" + sec + ":" + ms;
                        }
                        return ""+ sec + ":" + ms;
                    }
                    return "--:---";
        }
        return null;
    }

    @Override
    public String getColumnName(int columnIndex){
        return columns[columnIndex];
    }

}
