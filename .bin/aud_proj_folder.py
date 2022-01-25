import os
import shutil
import sys

DIRS = [
    "doc",
    "aud_doc",
    "aud_doc/obs",
    "aud_doc/resp_obs",
    "artefactos",
    "artefactos/informe",
    "artefactos/sprint_zero",
    "data",
    "python",
    "R",
    "query",
    "img",
    "validation",
]

FILES = ["notes.md"]


def create_folder(folder_name: str) -> None:
    path_folder = os.getcwd()
    os.makedirs(os.path.join(path_folder, folder_name))


def create_file(file_name: str) -> None:
    path_file = os.getcwd()
    with open(os.path.join(path_file, file_name), "w"):
        pass


def remove_folder(folder_name: str) -> None:
    path_folder = os.getcwd()
    shutil.rmtree(os.path.join(path_folder, folder_name), ignore_errors=True)


def remove_file(file_name: str) -> None:
    path_folder = os.getcwd()
    try:
        os.remove(os.path.join(path_folder, file_name))
    except FileNotFoundError:
        pass


def main():
    if len(sys.argv) == 1:
        print("Generando Directorio Auditoría")
        try:
            list(map(create_folder, DIRS))
            list(map(create_file, FILES))
        except FileExistsError:
            print(
                "Directorio fue creado con anterioridad,"
                " si se quiere reacher utilizar la opción --remove"
            )
            return
        print("Se generó Directorio Auditoría")
    else:
        if sys.argv[1] == "--remove":
            print("Removiendo Directorio Auditoría")
            list(map(remove_folder, DIRS))
            list(map(remove_file, FILES))
            print("Directorio ha sido removido.")
        else:
            print("Solo estás permitida la opción: --remove")


if __name__ == "__main__":
    main()
