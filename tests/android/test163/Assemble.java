import brut.androlib.src.SmaliBuilder;
import brut.directory.ExtFile;
import java.io.File;
public final class Assemble {
    public static void main(String[] args) throws Exception {
        SmaliBuilder.build(new ExtFile(new File(args[0])), new File(args[1]), 28);
    }
}
