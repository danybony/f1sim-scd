
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

    String[] columns = {"Position", "Name", "Team", "Lap", "Sector", "Speed (Km/h)", "Top Speed (Km/h)", "Best lap", "Last lap", "Total Time (gap)"};

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
            case 0: return rowIndex+1;

            case 1: return logger.getDriver(rowIndex).getName();

            case 2: return logger.getDriver(rowIndex).getTeam();

            case 3: return logger.getDriver(rowIndex).getCurrentLap();

            case 4: if(logger.getDriver(rowIndex).getState() == 1) {
                        return logger.getDriver(rowIndex).getCurrentSegment() + " - box";
                    }
                    if(logger.getDriver(rowIndex).getState() == -1) {
                        return "Out";
                    }
                    if(logger.getDriver(rowIndex).getState() == 2) {
                        return "Race finished";
                    }
                    return logger.getDriver(rowIndex).getCurrentSegment();

            case 5: if(logger.getDriver(rowIndex).getState() == 2) {
                        return "0.0";
                    }
                    return logger.getDriver(rowIndex).getSpeed();

            case 6: return logger.getDriver(rowIndex).getTopSpeed();

            case 7: if(logger.getDriver(rowIndex).getCurrentLap() != 0 &&
                            logger.getDriver(rowIndex).getCurrentLap() != 1){
                        int min = (int) (logger.getDriver(rowIndex).getBestLap() / 60000);
                        int sec = (int) ((logger.getDriver(rowIndex).getBestLap() / 1000) % 60);
                        int ms  = (int) (logger.getDriver(rowIndex).getBestLap() % 1000);
                        if(min != 0){
                            return ""+ min + ":" + sec + ":" + ms;
                        }
                        return ""+ sec + ":" + ms;
                    }
                    return "--:---";

            case 8: if(logger.getDriver(rowIndex).getCurrentLap() != 0 &&
                            logger.getDriver(rowIndex).getCurrentLap() != 1){
                        int min = (int) (logger.getDriver(rowIndex).getLastLap() / 60000);
                        int sec = (int) ((logger.getDriver(rowIndex).getLastLap() / 1000) % 60);
                        int ms  = (int) (logger.getDriver(rowIndex).getLastLap() % 1000);
                        if(min != 0){
                            return ""+ min + ":" + sec + ":" + ms;
                        }
                        return ""+ sec + ":" + ms;
                    }
                    return "--:---";

             case 9: if(rowIndex == 0 || logger.getDriver(rowIndex).getState() == -1){
                        if(logger.getDriver(rowIndex).getTotalTime() != 0){
                            int min = (int) (logger.getDriver(rowIndex).getTotalTime() / 60000);
                            int sec = (int) ((logger.getDriver(rowIndex).getTotalTime() / 1000) % 60);
                            int ms  = (int) (logger.getDriver(rowIndex).getTotalTime() % 1000);
                            if(min != 0){
                                return ""+ min + ":" + sec + ":" + ms;
                            }
                            return ""+ sec + ":" + ms;
                        }
                        return "--:---";
                    }
                    else{
                         if(logger.getDriver(rowIndex).getDifference() != 0){
                            int min = (int) (logger.getDriver(rowIndex).getDifference() / 60000);
                            int sec = (int) ((logger.getDriver(rowIndex).getDifference() / 1000) % 60);
                            int ms  = (int) (logger.getDriver(rowIndex).getDifference() % 1000);
                            if(min != 0){
                                return "+ "+ min + ":" + sec + ":" + ms;
                            }
                            return "+ "+ sec + ":" + ms;
                        }
                        return "--:---";
                    }
        }
        return null;
    }

    @Override
    public String getColumnName(int columnIndex){
        return columns[columnIndex];
    }

}
